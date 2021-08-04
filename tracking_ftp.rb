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
            shipping_company = master_bill_lading[0..3]
            #check to see if this is a supported scac code, otherwise next
            my_scac_code = ShippingLineScacCode.where("scac_code = ?", shipping_company)
            puts "my_scac_code = #{my_scac_code.inspect}"
            if my_scac_code == nil || my_scac_code == []
              puts "That scac code is not supported by Vizion API, moving to next row"
              next
            end
            container_id = row['Container #']
            if container_id != nil && container_id !~ /\//i
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
      #Grab all container_trackings where finished_journey = f
      
      #tracking_csv = CSV.generate do |csv|
      
      container_ids = Array.new
      my_containers = ContainerTracking.where("finished_journey = ?", false)
      my_containers.each do |myc|
        container_ids.push(myc.container_id)

      end
      puts "container_id = #{container_ids.inspect}"

      filename = name_csv
      CSV.open(filename, 'a+') do |csv|
        csv << ['container_id', 'milestone_timestamp', 'location_name','location_city', 'location_country', 'location_unlocode', 'location_facility', 'description', 'raw_description', 'vessel_imo', 'vessel_mmsi', 'voyage', 'mode', 'vessel']
      container_ids.each do |mycont|
        my_rec = ContainerMilestone.where("container_id = ? and planned = ?", mycont, false).order(:milestone_timestamp).reverse.first
        if my_rec.nil?
          puts "Container_id #{mycont} has no milestones"
        else
          #Create CSV row here
          csv << [my_rec.container_id, my_rec.milestone_timestamp, my_rec.location_name, my_rec.location_city, my_rec.location_country, my_rec.location_unlocode, my_rec.location_facility, my_rec.description, my_rec.raw_descripition, my_rec.vessel_imo, my_rec.vessel_mmsi, my_rec.voyage, my_rec.mode, my_rec.vessel]

        end

      end

      end #csv generate
      upload_tracking_csv(filename, "last_milestone_tracking")

      #Below is estimated_time_arrival = true

      new_filename = estimated_name_csv

      CSV.open(new_filename, 'a+') do |csv|
        csv << ['container_id', 'milestone_timestamp', 'location_name','location_city', 'location_country', 'location_unlocode', 'location_facility', 'description', 'raw_description', 'vessel_imo', 'vessel_mmsi', 'voyage', 'mode', 'vessel']
      container_ids.each do |mycont|
        my_rec = ContainerMilestone.where("container_id = ? and estimated_time_arrival = ?", mycont, true).order(:milestone_timestamp).reverse.first
        if my_rec.nil?
          puts "Container_id #{mycont} has no ETAs"
        else
          #Create CSV row here we are grabbing the first in reverse milestone timptamp order
            csv << [my_rec.container_id, my_rec.milestone_timestamp, my_rec.location_name, my_rec.location_city, my_rec.location_country, my_rec.location_unlocode, my_rec.location_facility, my_rec.description, my_rec.raw_descripition, my_rec.vessel_imo, my_rec.vessel_mmsi, my_rec.voyage, my_rec.mode, my_rec.vessel]
            puts my_rec.inspect
          

        end

      end

      end #csv generate
      #below to go back to parent directory
      
      upload_tracking_csv(new_filename, "estimated_arrival_tracking")
      close

      #Here mark finished_journey = true, upload full history, then mark upload = true

      



    end

    def name_csv
      
      "Milestone_#{Time.current.strftime('%Y_%m_%d_%H_%M_%S_%L')}.csv"
    end

    def estimated_name_csv
      "ETA_#{Time.current.strftime('%Y_%m_%d_%H_%M_%S_%L')}.csv"
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

    


end