class TrackingFTP < Net::FTP
  Dotenv.load

  Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }
  Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

    def initialize
      @url = ENV['TRACKING_FTP_HOST']
      @username = ENV['TRACKING_FTP_USERNAME']
      @password = ENV['TRACKING_FTP_PASSWORD']
      @port = ENV['TRACKING_FTP_PORT']
      super
      puts "#{@url}, #{@port}"
      puts "#{@username}, #{@password}"
      connect(@url, @port)
      login(@username, @password)
    end

    def pull_tracking_info
        directory = '/Outbound'
        puts "Polling tracking FTP server: #{directory}"
        chdir directory
        # in production match against: ORDERTRK, when manually testing match against TEST
        mlsd.select { |entry| entry.type == 'file' && /.csv/.match?(entry.pathname) }.each do |entry|
          puts "Found #{entry.pathname}"
          process_tracking_csv(entry.pathname)
          #here move files to Archive
          move_file_to_archive(entry.pathname)
        end
    end


    def process_tracking_csv(path)
        puts "Starting Tracking CSV processing of #{path}"
        #tracking_data = get_tracking_csv(path)

        myfile_data = getbinaryfile(path, nil)
        puts myfile_data.inspect
        puts "------"
        puts myfile_data
        mynew_csv = CSV.new(myfile_data, headers: true)
        puts mynew_csv.inspect
        mynew_csv.each do |row|
            puts row.inspect
            #check to see if Master BOL is null or not, then grab first four chars to set scac code
            master_bill_lading = row['MASTER BOL']
            if master_bill_lading == "" || master_bill_lading.nil?
              puts "Master Bill of Lading Field is null, not processing"
              next
            end
            #check here container matches 4letters7digits
            container_id = row['Container #']
            if container_id !~ /\A[a-zA-Z]{4}\d{7}/
              puts "Container info: #{container_id} is not correct, skipping"
              next
            end

            shipping_company = master_bill_lading[0..3]
            #check to see if this is a supported scac code, otherwise next
            my_carrier_code = ShippingLineCarrierCode.where("carrier_code = ?", shipping_company)
            puts "my_carrier_code = #{my_carrier_code.inspect}"
            if my_carrier_code == nil || my_carrier_code == []
              puts "That carrier code is not supported by Vizion API will try and create by auto-carrier"
              #try to create request via auto_carrier
              my_container = ContainerTracking.find_by_container_id(container_id)
              if my_container != nil
                puts "Not creating new record"
              else
                ContainerTracking.create(container_id: container_id, bill_of_lading: master_bill_lading)
              end
            elsif container_id != nil && container_id !~ /\//i
              my_container = ContainerTracking.find_by_container_id(container_id)
              if my_container != nil
                puts "Not creating new record"
              else
                ContainerTracking.create(shipping_company: shipping_company, container_id: container_id, bill_of_lading: master_bill_lading)
              end
            else
              puts "container_id = #{container_id}, bad data, skipping this row."
            end
        end
           
    end

    def move_file_to_archive(path)
      begin
        puts "Archiving #{path} on FTP server"
        pathname = Pathname.new path
        rename(path, pathname.dirname + 'Archive' + pathname.basename)
      rescue Net::FTPPermError => e
        puts e
        puts 'Archive file exists already or cannot be overwritten. Removing original.'
        delete path
      end
    end


    def upload_tracking_file_ftp
      #Grab all container_trackings where finished_journey = f and associated container_milestones via sql

      my_containers_sql = "select container_trackings.container_id , container_trackings.shipping_company, container_milestones.milestone_timestamp, container_milestones.location_name, container_milestones.location_city,  container_milestones.location_country, container_milestones.location_unlocode, container_milestones.location_facility,  container_milestones.description, container_milestones.raw_descripition, container_milestones.vessel_imo, container_milestones.vessel_mmsi, container_milestones.voyage, container_milestones.mode, container_milestones.vessel  from container_trackings, container_milestones where container_trackings.container_id = container_milestones.container_id and container_trackings.finished_journey = 'f' and container_trackings.uploaded = 'f' "
      my_containers = ActiveRecord::Base.connection.execute(my_containers_sql).values

      #puts my_containers.inspect

      puts "Starting regular milestones"
      
      filename = name_csv
      #col_sep = "\t"
      CSV.open(filename, 'a+',  :write_headers=> true,
        :headers => ['container_id', 'milestone_timestamp', 'location_name','location_city', 'location_country', 'location_unlocode', 'location_facility', 'description', 'raw_description', 'vessel_imo', 'vessel_mmsi', 'voyage', 'mode', 'vessel', 'shipping_company']) do |csv|
        
        my_containers.each do |mycont|
          puts mycont.inspect
        
          #Create CSV row here
          #wash out commas in selected fields for export
          temp_location_name = remove_comma(mycont[3])
          temp_location_city = remove_comma(mycont[4])
          temp_location_country = remove_comma(mycont[5])
          temp_location_unlocode = remove_comma(mycont[6])
          temp_location_facility = remove_comma(mycont[7])
          temp_description = remove_comma(mycont[8])
          temp_raw_description = remove_comma(mycont[9])
          temp_voyage = remove_comma(mycont[12])
          temp_mode = remove_comma(mycont[13])
          temp_vessel = remove_comma(mycont[14])

          csv << [mycont[0], mycont[2], temp_location_name, temp_location_city, temp_location_country, temp_location_unlocode, temp_location_facility, temp_description, temp_raw_description, mycont[10], mycont[11], temp_voyage, temp_mode, temp_vessel, mycont[1]]

        

      end

      end #csv generate
      
      upload_tracking_csv(filename, "last_milestone_tracking")

      #Here we determine if the journey is finished, so as to exclude it from ETAs.
      #my_finished_journey = "select container_milestones.container_id, container_milestones.milestone_timestamp, container_milestones.location_city from container_milestones, destination_ports where destination_ports.container_id = container_milestones.container_id and LOWER(container_milestones.location_city) = LOWER(destination_ports.city) and container_milestones.planned = 'f' "

      my_finished_journey = "update container_trackings set finished_journey = 't' from (select container_milestones.container_id from container_milestones, destination_ports where destination_ports.container_id = container_milestones.container_id and LOWER(container_milestones.location_city) = LOWER(destination_ports.city) and container_milestones.planned = 'f' ) as subquery where container_trackings.container_id = subquery.container_id"

      my_uploaded_sql = "update container_trackings set uploaded = 't' where finished_journey = 't' "


      
      my_finished_recs = ActiveRecord::Base.connection.execute(my_finished_journey)

      my_uploaded_milestones = ActiveRecord::Base.connection.execute(my_uploaded_sql)
      

      new_filename = estimated_name_csv

      TemporaryEta.delete_all
      #Now reset index
      ActiveRecord::Base.connection.reset_pk_sequence!('temporary_etas')
      
      

      my_containers_sql = "insert into temporary_etas (container_id, milestone_timestamp, location_name, location_city, location_country, location_unlocode, location_facility, description, raw_descripition, vessel_imo, vessel_mmsi, voyage, mode, vessel, shipping_company)  select container_trackings.container_id ,  container_milestones.milestone_timestamp, container_milestones.location_name, container_milestones.location_city,  container_milestones.location_country, container_milestones.location_unlocode, container_milestones.location_facility,  container_milestones.description, container_milestones.raw_descripition, container_milestones.vessel_imo, container_milestones.vessel_mmsi, container_milestones.voyage, container_milestones.mode, container_milestones.vessel, container_trackings.shipping_company from container_trackings, container_milestones where container_milestones.container_id = container_trackings.container_id and container_milestones.estimated_time_arrival = 't' and container_trackings.finished_journey = 'f'"

      ActiveRecord::Base.connection.execute(my_containers_sql)

      #Find destination port here
      #select container_milestones.container_id, container_milestones.milestone_timestamp, container_milestones.location_city, destination_ports.city from container_milestones, destination_ports where destination_ports.container_id = container_milestones.container_id and destination_ports.city = container_milestones.location_city and container_milestones.estimated_time_arrival = 'f' and container_milestones.planned = 't' and container_milestones.milestone_timestamp is not null and container_milestones.raw_descripition ilike '%arriv%';




      my_etas_sql = "select container_id, MAX(milestone_timestamp) from temporary_etas group by container_id "

      #puts "starting etas selection"
      my_etas = ActiveRecord::Base.connection.execute(my_etas_sql).values
      #puts my_etas.inspect
      #puts "*******"

      
      

      puts "STarting ETA info"

      CSV.open(new_filename, 'a+', :write_headers=> true,
        :headers => ['container_id', 'milestone_timestamp', 'location_name','location_city', 'location_country', 'location_unlocode', 'location_facility', 'description', 'raw_description', 'vessel_imo', 'vessel_mmsi', 'voyage', 'mode', 'vessel', 'shipping_company']) do |csv|
        
          my_etas.each do |mycont|
            puts mycont.inspect
            next if mycont[1] == nil
            my_container_id = mycont[0]
            my_milestone_timestamp = mycont[1]
            my_eta_info = TemporaryEta.where("container_id = ? and milestone_timestamp = ?",my_container_id, my_milestone_timestamp ).order('milestone_timestamp desc').first 
            #puts "my_eta_info = #{my_eta_info.inspect}"

          
            #Create CSV row here
            #wash out commas in selected fields for export
            temp_location_name = remove_comma(my_eta_info.location_name)
            temp_location_city = remove_comma(my_eta_info.location_city)
            temp_location_country = remove_comma(my_eta_info.location_country)
            temp_location_unlocode = remove_comma(my_eta_info.location_unlocode)
            temp_location_facility = remove_comma(my_eta_info.location_facility)
            temp_description = remove_comma(my_eta_info.description)
            temp_raw_description = remove_comma(my_eta_info.raw_descripition)
            temp_voyage = remove_comma(my_eta_info.voyage)
            temp_mode = remove_comma(my_eta_info.mode)
            temp_vessel = remove_comma(my_eta_info.vessel)
  
            csv << [my_eta_info.container_id,  my_eta_info.milestone_timestamp, temp_location_name, temp_location_city, temp_location_country, temp_location_unlocode, temp_location_facility, temp_description, temp_raw_description, my_eta_info.vessel_imo,  my_eta_info.vessel_mmsi, temp_voyage, temp_mode, temp_vessel, my_eta_info.shipping_company ]
        

      end

      end #csv generate
      #below to go back to parent directory
      
      upload_tracking_csv(new_filename, "estimated_arrival_tracking")
      

      #Here mark finished_journey = true, upload full history, then mark upload = true

      my_no_tracking_sql = "select container_id, shipping_company, vizion_reference_id,  bill_of_lading, created_at, updated_at, finished_journey, uploaded from container_trackings where container_id not in (select container_id from container_milestones)"

      my_no_tracking = ActiveRecord::Base.connection.execute(my_no_tracking_sql).values

      no_milestone_filename = lack_milestone

      CSV.open(no_milestone_filename, 'a+', :write_headers=> true,
        :headers => ['container_id', 'shipping_company', 'vizion_reference_id','bill_of_lading', 'created_at', 'updated_at', 'finished_journey', 'uploaded']) do |csv|
          my_no_tracking.each do |myn|
            csv << [myn[0], myn[1], myn[2], myn[3], myn[4], myn[5], myn[6], myn[7] ]
            
          end


        end #CSV

      upload_tracking_csv(no_milestone_filename, "containers no milestones")
      close

    end

    def name_csv
      
      "Milestone_#{Time.current.strftime('%Y_%m_%d_%H_%M_%S_%L')}.csv"
    end

    def estimated_name_csv
      "ETA_#{Time.current.strftime('%Y_%m_%d_%H_%M_%S_%L')}.csv"
    end
    
    def lack_milestone
      "No_Milestone_#{Time.current.strftime('%Y_%m_%d_%H_%M_%S_%L')}.csv"
    end

    def upload_tracking_csv(file, message)
      directory = '/Inbound'
      puts "Starting orders csv upload of #{file} to #{directory} on ftp server"
      chdir directory
      put(File.open(file))
      #close
      File.delete(file)
      puts "Successfully uploaded CSV #{message}"
    end

    def remove_comma(myfield)
      #puts "myfield = #{myfield.inspect}"
      if myfield == nil
        return nil
      else
        #puts myfield.inspect
        my_return_field = myfield.gsub(/\,/i, " ")
        my_return_field = my_return_field.gsub(/\./i, " ")
        return my_return_field
      end
    end

    


end