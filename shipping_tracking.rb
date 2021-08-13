#shipping_tracking.rb
require 'dotenv'
require 'httparty'
require 'active_record'
require 'sinatra/activerecord'
require 'net/ftp'


Dotenv.load
Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

module ShippingInfo
  class TrackGetter
    

    def initialize
      #something here
      @host = ENV['TRACKING_FTP_HOST']
      @username = ENV['TRACKING_FTP_USERNAME']
      @password = ENV['TRACKING_FTP_PASSWORD']
      @port = ENV['TRACKING_FTP_PORT']

      @token = ENV['TRACKING_PRODUCTION_TOKEN']

      @my_request_header = {
        "X-API-Key" => @token,
        "Content-Type" =>"application/json"
      }

      @my_basic_header = {
        "X-API-Key" => @token,
        'include_metadata' => 'true'
      }

      @base_vizion_url = ENV['BASE_VIZION_URL_PRODUCTION']

      
    end


    def get_ftp_shipping_info
        puts "starting to get shipping info from ACS FTP site"
        Net::FTP.open(@host, @username, @password, @port) do |ftp|
            files = ftp.list
          
            puts "list out files in root directory:"
            puts files
            puts "--- chdir ----"
            files = ftp.chdir('Outbound')
            files = ftp.list('*.csv')
            puts files
            files.each do |myfile|
              puts "Found #{myfile}"
              myfile_path = myfile.match(/\d\d:\d\d\s.*/i).to_s
              myfile_path_fixed = myfile_path.gsub(/\d\d:\d\d\s/i, "")
              puts myfile_path_fixed
              
              myfile_data = ftp.getbinaryfile(myfile_path_fixed)
              puts myfile_data.inspect

            end


          end 



    end

    def test_vizion_api
      #POST 'https://demo.vizionapi.com/references'
      #UCMICMX56164        
      mybody = {
        "scac": "CMDU",
        "container_id": "ECMU4670610"
          
      }.to_json

      puts "#{@base_vizion_url}/references"
      puts @my_request_header
      puts mybody


      my_new_reference = HTTParty.post("#{@base_vizion_url}/references", :headers => @my_request_header, :body => mybody,  :timeout => 80)
      puts my_new_reference.inspect
      

    end


    def load_container_trackings

      ContainerTracking.delete_all
      ActiveRecord::Base.connection.reset_pk_sequence!('container_trackings')
      CSV.foreach('container_trackings.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        puts row.inspect
        ContainerTracking.create(container_id: row['container_id'], shipping_company: row['shipping_company'], vizion_reference_id: row['vizion_reference_id'], vision_organization_id: row['vision_organization_id'], bill_of_lading: row['bill_of_lading'], latest_status: row['latest_status'], created_at: row['created_at'], updated_at: row['updated_at'], finished_journey: row['finished_journey'], uploaded: row['uploaded'])

      end

      ContainerMilestone.delete_all
      ActiveRecord::Base.connection.reset_pk_sequence!('container_milestones')
      CSV.foreach('container_milestones.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        puts row.inspect
        ContainerMilestone.create(container_id: row['container_id'], milestone_timestamp: row['milestone_timestamp'] , location_name: row['location_name'], location_city: row['location_city'], location_country: row['location_country'],location_unlocode: row['location_unlocode'], location_facility: row['location_facility'],  description: row['description'], raw_descripition: row['raw_descripition'], vessel_imo: row['vessel_imo'], vessel_mmsi: row['vessel_mmsi'], voyage: row['voyage'], mode: row['mode'], vessel: row['vessel'], latitude: row['latitude'], longitude: row['longitude'], estimated_time_arrival: row['estimated_time_arrival'], planned: row['planned'] )

      end

      DestinationPort.delete_all
      ActiveRecord::Base.connection.reset_pk_sequence!('destination_ports')
      CSV.foreach('destination_ports.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        puts row.inspect
        DestinationPort.create(container_id: row['container_id'], port_name: row['port_name'], city: row['city'], state: row['state'], unlocode: row['unlocode'], facility: row['facility'], latitude: row['latitude'], longitude: row['longitude'])
      end

      



      puts "all done"


    end


    def containers_no_milestones
      puts "Starting containers with no milestones"
      my_containers_sql = "select container_id, vizion_reference_id, bill_of_lading from container_trackings where container_id not in (select container_id from container_milestones)"
      my_containers = ActiveRecord::Base.connection.execute(my_containers_sql).values
      #puts my_containers.inspect
      my_containers.each do |myc|
        #puts myc.inspect
        temp_container = myc[0]
        temp_reference_id = myc[1]
        temp_bill_lading = myc[2]
        puts "-------------"
        puts "Container_id = #{temp_container}, reference_id = #{temp_reference_id}, bill_lading: #{temp_bill_lading}"
        my_reference_info = HTTParty.get("#{@base_vizion_url}/references/#{temp_reference_id}/updates", :headers => @my_basic_header, :timeout => 80)

      
        puts "reference_id = #{temp_reference_id}"
        puts "response from Vizion = #{my_reference_info.parsed_response}"

        puts "-------------"
        sleep 4

      end


    end

    def no_etas_container_file
      puts "STarting"

      File.delete('containers_no_etas.csv') if File.exist?('containers_no_etas.csv')

      column_header = ["container_id", "finished_journey", "no_milestones", "eta_available" ]

      CSV.open('containers_no_etas.csv','a+', :write_headers=> true, :headers => column_header) do |hdr|
        column_header = nil

      CSV.foreach('no_etas_8_13.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        #puts row.inspect
        puts row['Container #']
        container_id = row['Container #']
        container_tracking = ContainerTracking.where("container_id = ?", container_id).first
        container_milestone = ContainerMilestone.where("container_id = ? and estimated_time_arrival = ?", container_id, true).order(milestone_timestamp: :desc).first
        puts container_tracking.inspect
        puts container_milestone.inspect

        tracking_info = "container_id not in system"

        if container_tracking.nil?
          tracking_info = "container_id not in system"

        else
          tracking_info = container_tracking.finished_journey
        end
        
        no_milestones = false
        if container_milestone.nil?
          no_milestones = true
        else
          no_milestones = false
        end

        eta_available = false
        if container_milestone.nil?
          eta_available = false
        else
          eta_available =  container_milestone.estimated_time_arrival
        end
        

        csv_data_out = [container_id, tracking_info, no_milestones, eta_available]

        hdr << csv_data_out

      end

      end #close csv

    end



    def containers_no_etas
      puts "Starting"
      container_ids = Array.new
      my_containers = ContainerTracking.where("finished_journey = ?", false)
      my_containers.each do |myc|
        my_hash = {"container_id" => myc.container_id, "shipping_company" => myc.shipping_company, "vizion_reference_id" => myc.vizion_reference_id, "vision_organization_id" => myc.vision_organization_id, "bill_of_lading" => myc.bill_of_lading }
        container_ids.push(my_hash)

      end
      puts "container_id = #{container_ids.inspect}"

      File.delete('containers_no_etas.csv') if File.exist?('containers_no_etas.csv')

      column_header = ["container_id", "shipping_company", "vizion_reference_id","vision_organization_id", "bill_of_lading" ]

      CSV.open('containers_no_etas.csv','a+', :write_headers=> true, :headers => column_header) do |hdr|
        column_header = nil

      container_ids.each do |mycont|
        #puts mycont['container_id']
        my_rec = ContainerMilestone.where("container_id = ? and estimated_time_arrival = ?", mycont['container_id'], true).order(:milestone_timestamp).reverse.first
        if my_rec.nil?
          puts "Container_id #{mycont['container_id']} has no milestones"
          csv_data_out = [mycont['container_id'], mycont['shipping_company'], mycont['vizion_reference_id'], mycont['vision_organization_id'], mycont['bill_of_lading'] ]
          hdr << csv_data_out
        #  csv_data_out = [mycont]
        else
          puts "we have an ETA for this container: #{mycont['container_id']}"
        end
        

      end

      end #CSV


    end


    def stop_tracking
      puts "Starting to remove containers from tracking ..."
      CSV.foreach('stop_tracking.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        puts row.inspect
        my_container = row['CONTAINER']
        #my_sql_delete_milestones = "delete from container_milestones where container_id = \'#{my_container}\'"
        #ActiveRecord::Base.connection.execute(my_sql_delete_milestones)
        #my_sql_delete_destination_port = "delete from destination_ports where container_id = \'#{my_container}\'"
        #ActiveRecord::Base.connection.execute(my_sql_delete_destination_port)
        ContainerMilestone.where( "container_id = ?", my_container).destroy_all
        DestinationPort.where("container_id = ?", my_container).destroy_all
        ContainerTracking.where("container_id = ?", my_container).destroy_all
        
      end
      puts "All done"

    end

    def containers_should_track_info
      ContainerShouldTrack.delete_all
      #Now reset index
      ActiveRecord::Base.connection.reset_pk_sequence!('containers_should_tracks')
      CSV.foreach('most_recent_container_list.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        puts row.inspect
        ContainerShouldTrack.create(container_id: row['Container #'], shipping_company: row['Bill Of Lading'][0..3], bill_of_lading: row['Bill Of Lading'])
      end

      my_containers_not_tracked_sql = "select container_id, shipping_company, bill_of_lading, created_at from containers_should_tracks where container_id not in (select container_id from container_trackings)"

      my_containers_not_tracked = ActiveRecord::Base.connection.execute(my_containers_not_tracked_sql).values

      File.delete('containers_no_should_track.csv') if File.exist?('containers_no_should_track.csv')

      column_header = ["container_id", "shipping_company", "bill_of_lading", "created_at", "vizion_reference_id" ]

      CSV.open('containers_no_should_track.csv','a+', :write_headers=> true, :headers => column_header) do |hdr|
        column_header = nil

        my_containers_not_tracked.each do |myc|
          puts myc.inspect
          csv_data_out = [myc[0], myc[1], myc[2], myc[3]]
          hdr << csv_data_out

        end
        csv_data_out = ["------------ Containers with No Milestones -----------"]
        hdr << csv_data_out

      my_containers_no_milestones_sql = "select container_id, shipping_company, bill_of_lading, created_at, vizion_reference_id from container_trackings where finished_journey = 'f' and container_id not in (select container_id from container_milestones)"

      my_containers_no_milestones = ActiveRecord::Base.connection.execute(my_containers_no_milestones_sql).values
      my_containers_no_milestones.each do |mycnm|
        csv_data_out = [mycnm[0], mycnm[1], mycnm[2], mycnm[3], mycnm[4]]
        hdr << csv_data_out

      end

      csv_data_out = ["------------ Containers with No Tracking References -----------"]
      hdr << csv_data_out
      my_containers_no_tracking_sql = "select container_id, shipping_company, bill_of_lading, created_at from container_trackings where finished_journey = 'f' and vizion_reference_id is null"

      my_containers_no_tracking = ActiveRecord::Base.connection.execute(my_containers_no_tracking_sql).values

      my_containers_no_tracking.each do |mycnt|
        csv_data_out = [mycnt[0], mycnt[1], mycnt[2], mycnt[3]]
        hdr << csv_data_out

      end



      end #csv



    end




    def test_vizion_milestone(reference_id, container_id)
      my_reference_info = HTTParty.get("#{@base_vizion_url}/references/#{reference_id}/updates", :headers => @my_basic_header, :timeout => 80)

      
      puts "reference_id = #{reference_id}"
      puts "response = #{my_reference_info.parsed_response}"

      puts "-------------"

      puts "------ pretty JSON--------"
      puts JSON.pretty_generate(my_reference_info.parsed_response)

      puts "----------------------------"

      exit

      my_destination_ports = my_reference_info.parsed_response

      my_destination_ports.each do |myport|
        my_port = myport['payload']['destination_port']
        puts "-----"
        puts my_port.inspect
        puts "-----"

      end
      exit

      payloads = my_reference_info.parsed_response
      

      payloads.each do |myp|
        puts "***start***"
        puts myp.inspect
        puts "****** end *****"
        my_milestones = myp['payload']['milestones']
        my_milestones.each do |mym|
          puts "--- milestone start ---"
          puts mym.inspect
          puts "---- milestone end -----"

        end

      end

      #puts "calling method --"

      #process_vizion_api_data(my_reference_info.parsed_response, container_id)

    end


    def create_vizion_references_from_container_trackings
      my_container_tracking = ContainerTracking.where("vizion_reference_id is null ")
      my_container_tracking.each do |mycont|
        puts mycont.inspect
        mybody = { }
        if mycont.shipping_company == 'EGLV'
          mybody = {
            "scac": mycont.shipping_company,
            "bill_of_lading": mycont.bill_of_lading,
            "container_id": mycont.container_id
              
          }.to_json


        else
          mybody = {
            "scac": mycont.shipping_company,
            "container_id": mycont.container_id
              
          }.to_json

        end
        
        my_new_reference = HTTParty.post("#{@base_vizion_url}/references", :headers => @my_request_header, :body => mybody,  :timeout => 80)

        if my_new_reference.parsed_response['message'] == 'Reference created successfully.'
          #save info for gettign milestones
          my_reference = my_new_reference.parsed_response['reference']['id']
          my_organization_id = my_new_reference.parsed_response['reference']['organization_id']
          mycont.vizion_reference_id = my_reference
          mycont.vision_organization_id = my_organization_id
          mycont.save!
        else
          puts "Could not create reference for this container."
        end
        puts "Sleeping 3 secs"
        sleep 3

      end

    end

    def test_call_reference_id(reference_id, container_id)
      
      my_reference_info = HTTParty.get("#{@base_vizion_url}/references/#{reference_id}/updates", :headers => @my_basic_header, :timeout => 80)
      puts my_reference_info.inspect
      #process_vizion_api_data(my_reference_info.parsed_response, container_id)


    end

    def create_milestones_from_container_tracking
      #Get milestones for all containter_tracking where finished_journey = f

      my_now = Time.now

      my_containers = ContainerTracking.where("finished_journey = ?", false)
      my_containers.each do |mycont|
        reference_id = mycont.vizion_reference_id
        container_id = mycont.container_id
        my_reference_info = HTTParty.get("#{@base_vizion_url}/references/#{reference_id}/updates", :headers => @my_basic_header, :timeout => 80)

        puts "response = #{my_reference_info.parsed_response}, reference_id = #{reference_id}, container_id = #{container_id}"

        if my_reference_info.parsed_response == []
          puts "No response at all, skipping"
          next

        end

        if my_reference_info.parsed_response == {"error"=>"Reference not found."} || my_reference_info.parsed_response == {"message"=>"Endpoint request timed out"}
          puts "Error response, skipping"
          next
        end

        process_vizion_api_data(my_reference_info.parsed_response, container_id)

        

        puts "Sleeping 3"
        sleep 3

        

      end

      my_current = Time.now
      duration = (my_current - my_now).ceil
      my_minutes = (duration/60).ceil
      my_seconds = (duration % 60)
      puts "Ran #{duration} seconds, #{my_minutes} minutes, #{my_seconds} seconds"

    end

    def process_vizion_api_data(myhash, container_id)
      #use below later for bulk updating no time now ...
      local_milestones = Array.new
      local_destination_ports = Array.new
      #2021-05-24T00:00:00.000+06:00
      myformat =  "%Y-%m-%d %H:%M:%S.%L"
      #testing only 
      #container_id = 'ECMU4670610'
      #Nuke and pave container_milestones table by container_id
      #delete_sql = "delete from container_milestones where container_id = \'#{container_id}\'"
      #ActiveRecord::Base.connection.execute(delete_sql)
      #exit
      #Nuke and pave container_milestones table by container_id
      myhash.each do |myh|
        #container_id = myh['payload']['container_id']

        #Here update or insert destination_port information
        my_port = myh.dig('payload', 'destination_port')
        #{"name"=>"HALIFAX, NS", "city"=>"Halifax", "state"=>"Nova Scotia", "country"=>"Canada", "unlocode"=>"CAHAL", "facility"=>nil, "geolocation"=>{"latitude"=>44.64876350000001, "longitude"=>-63.5752387}}

        if my_port != nil

          temp_port = {"container_id" => container_id, "port_name" => my_port.dig('name'), "city" => my_port.dig('city'), "state" => my_port.dig('country'), "unlocode" => my_port.dig('facility'), "latitude" => my_port.dig('geolocation', 'latitude'), "longitude" => my_port.dig('geolocation', 'latitude')  }

          local_destination_ports.push(temp_port)

        else
          puts "No destination port"
        end


        puts "-----"
        puts myh
        my_temp_milestone = myh['payload']['milestones']
        my_temp_milestone.each do |myt|
          puts "*****"
          puts myt
          is_planned = myt['planned']
          puts "is_planned = #{is_planned}"
          
            #myt['container_id'] = container_id

            if myt['timestamp'] == nil
              temp_timestamp = nil
            else
            
            temp_timestamp = myt['timestamp'].gsub(/\+\d+:\d\d/i, "")
            temp_timestamp = temp_timestamp.gsub(/\T/i, " ")
            #puts temp_timestamp
            #puts myformat
            end

            #my_milestone_timestamp = DateTime.strptime(temp_timestamp, myformat)

            temp_estimated_time_arrival = false
            my_destination_city = nil
            new_temp_city = myt.dig('location', 'city')

            my_destination_port = DestinationPort.find_by_container_id(container_id)
            if my_destination_port != nil && my_destination_port != []
              my_destination_city = my_destination_port.city
            else 
              my_destination_city = nil
            end

            #puts "STARTING BLOCK estimated_time_arrival = t, #{myt['raw_description']}, #{myt['planned']}"
            if ( myt['raw_description'] =~ /estim.+/i ||  myt['raw_description'] =~ /vessel\sarrive.+destination\sport/i ) 
              #puts "Setting estimated_time_arrival = t, #{myt['raw_description']}, #{myt['planned']}"
              temp_estimated_time_arrival = true
            elsif (my_destination_city != nil  && new_temp_city != nil) #need to handle all nil cases
              #puts "City stuff: milestone city = #{new_temp_city.downcase} and destination city = #{my_destination_city.downcase}"
              if ( new_temp_city.downcase == my_destination_city.downcase )
              temp_estimated_time_arrival = true
              end
            else
              temp_estimated_time_arrival = false
            end
            
            
            temp_location_name = myt.dig('location', 'name')
            temp_location_country = myt.dig('location', 'country')
            temp_location_city = myt.dig('location', 'city')
            temp_location_unlocode = myt.dig('location', 'unlocode')
            temp_location_facility = myt.dig('location', 'facility')
            temp_description = myt.dig('description')
            temp_raw_description = myt.dig('raw_description')
            temp_vessel_imo = myt.dig('vessel_imo')
            temp_vessel_mmsi = myt.dig('vessel_mmsi')
            temp_voyage = myt.dig('voyage')
            temp_mode = myt.dig('mode')
            temp_vessel = myt.dig('vessel')
            temp_planned = myt.dig('planned')
            temp_latitude = myt.dig('location', 'geolocation', 'latitude')
            temp_longitude = myt.dig('location', 'geolocation', 'longitude')
            #error_message = response.parsed_response.dig('errors', 'status')

            temp_hash = {
              'container_id' => container_id, 'milestone_timestamp' => temp_timestamp, 'location_name' => temp_location_name, 'location_city' => temp_location_city, 'location_country' => temp_location_country, 'location_unlocode' => temp_location_unlocode, 'location_facility' => temp_location_facility, 'description' => temp_description, 'raw_descripition' => temp_raw_description, 'vessel_imo' => temp_vessel_imo, 'vessel_mmsi' => temp_vessel_mmsi, 'voyage' => temp_voyage, 'mode' => temp_mode, 'vessel' => temp_vessel, 'latitude' => temp_latitude, 'longitude' => temp_longitude, 'planned' =>  temp_planned, 'estimated_time_arrival' => temp_estimated_time_arrival}

              puts "temp_hash = #{temp_hash.inspect}"
              

            

            local_milestones.push(temp_hash)

            #ContainerMilestone.create(container_id: container_id, milestone_timestamp: temp_timestamp, location_name: myt['location']['name'], location_city: myt['location']['city'], location_country: myt['location']['country'], location_unlocode: myt['location']['unlocode'], location_facility: myt['location']['facility'], description: myt['description'], raw_descripition: myt['raw_description'], vessel_imo: myt['vessel_imo'], vessel_mmsi: myt['vessel_mmsi'], voyage: myt['voyage'], mode: myt['mode'], vessel: myt['vessel'], latitude: myt['location']['geolocation']['latitude'], longitude: myt['location']['geolocation']['longitude'] )

          
          puts "****"
        end
        puts "------"

      end

      #Bulk upsert
      local_milestones = local_milestones.uniq
      puts "local_milestones = #{local_milestones.inspect}"
      if local_milestones != []
        
        ContainerMilestone.where("container_id = ? ", container_id).destroy_all
        my_result = ContainerMilestone.insert_all(local_milestones)
        puts "my_result = #{my_result.inspect}"
      else
        puts "No milestones yet for this container: #{container_id}"
      end

      local_destination_ports = local_destination_ports.uniq
      puts "local_destination_ports = #{local_destination_ports.inspect}"
      if local_destination_ports != []
        my_result = DestinationPort.insert_all(local_destination_ports)
        puts "my_result = #{my_result.inspect}"

      else
        puts "No destination ports yet for this container: #{container_id}"
      end


      #puts local_milestones.inspect
      #my_milestone_recs = ContainerMilestone.where("container_id = ?", 'ECMU4670610').order(:milestone_timestamp).reverse.first
      #puts my_milestone_recs.inspect
      

    end


    def load_in_shipping_lines_info
      ShippingLineCarrierCode.delete_all
      ActiveRecord::Base.connection.reset_pk_sequence!('shipping_lines_carrier_codes')
      ShippingLineScacCode.delete_all
      ActiveRecord::Base.connection.reset_pk_sequence!('shipping_lines_scac_codes')

      CSV.foreach('shipping_lines_master.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        puts row.inspect
        ShippingLineCarrierCode.create(carrier_name: row['carrier_name'], carrier_id: row['carrier_id'], carrier_code: row['carrier_code'])
      end

      CSV.foreach('shipping_lines_scac_codes.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
        puts row.inspect
        ShippingLineScacCode.create(carrier_code: row['carrier_code'], scac_code: row['scac_code'])
      end

    end

    


  end
end