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

      @token = ENV['TRACKING_SANDBOX_TOKEN']

      @my_request_header = {
        "X-API-Key" => @token,
        "Content-Type" =>"application/json"
      }

      @my_basic_header = {
        "X-API-Key" => @token,
        'include_metadata' => 'true'
      }

      @base_vizion_url = ENV['BASE_VIZION_URL']

      
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


    def create_vizion_references_from_container_trackings
      my_container_tracking = ContainerTracking.where("vizion_reference_id is null ")
      my_container_tracking.each do |mycont|
        puts mycont.inspect
        mybody = {
          "scac": mycont.shipping_company,
          "container_id": mycont.container_id
            
        }.to_json
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

    def test_call_reference_id
      #curl --location --request GET 'https://demo.vizionapi.com/references/905c8e59-631d-4338-9e47-0fca2d6ee61c/updates' \
      #--header 'X-API-Key: yourApiKey'
      reference_id = "8f7c85e1-865b-4c90-a794-9a8e99aa474b"
      container_id =  'DFSU6679443'

      my_reference_info = HTTParty.get("#{@base_vizion_url}/references/#{reference_id}/updates", :headers => @my_basic_header, :timeout => 80)
      #puts my_reference_info.inspect
      process_vizion_api_data(my_reference_info.parsed_response, container_id)


    end

    def create_milestones_from_container_tracking
      #Get milestones for all containter_tracking where finished_journey = f
      my_containers = ContainerTracking.where("finished_journey = ?", false)
      my_containers.each do |mycont|
        reference_id = mycont.vizion_reference_id
        container_id = mycont.container_id
        my_reference_info = HTTParty.get("#{@base_vizion_url}/references/#{reference_id}/updates", :headers => @my_basic_header, :timeout => 80)

        process_vizion_api_data(my_reference_info.parsed_response, container_id)

        puts "Sleeping 3"
        sleep 3

        

      end


    end

    def process_vizion_api_data(myhash, container_id)
      #use below later for bulk updating no time now ...
      local_milestones = Array.new
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
        


        puts "-----"
        puts myh
        my_temp_milestone = myh['payload']['milestones']
        my_temp_milestone.each do |myt|
          puts "*****"
          puts myt
          is_planned = myt['planned']
          puts "is_planned = #{is_planned}"
          
            #myt['container_id'] = container_id
            
            temp_timestamp = myt['timestamp'].gsub(/\+\d+:\d\d/i, "")
            temp_timestamp = temp_timestamp.gsub(/\T/i, " ")
            #puts temp_timestamp
            #puts myformat

            my_milestone_timestamp = DateTime.strptime(temp_timestamp, myformat)

            temp_estimated_time_arrival = false
            
            if myt['raw_description'] =~ /estim.+/i
              temp_estimated_time_arrival = true
            else
              temp_estimated_time_arrival = false
            end
            
            temp_hash = {
              'container_id' => container_id, 'milestone_timestamp' => temp_timestamp, 'location_name' => myt['location']['name'], 'location_city' => myt['location']['city'], 'location_country' => myt['location']['country'], 'location_unlocode' => myt['location']['unlocode'], 'location_facility' => myt['location']['facility'], 'description' => myt['description'], 'raw_descripition' => myt['raw_description'], 'vessel_imo' => myt['vessel_imo'], 'vessel_mmsi' => myt['vessel_mmsi'], 'voyage' => myt['voyage'], 'mode' => myt['mode'], 'vessel' => myt['vessel'], 'latitude' => myt['location']['geolocation']['latitude'], 'longitude' => myt['location']['geolocation']['longitude'], 'planned' =>  myt['planned'], 'estimated_time_arrival' => temp_estimated_time_arrival}

            

            local_milestones.push(temp_hash)

            #ContainerMilestone.create(container_id: container_id, milestone_timestamp: temp_timestamp, location_name: myt['location']['name'], location_city: myt['location']['city'], location_country: myt['location']['country'], location_unlocode: myt['location']['unlocode'], location_facility: myt['location']['facility'], description: myt['description'], raw_descripition: myt['raw_description'], vessel_imo: myt['vessel_imo'], vessel_mmsi: myt['vessel_mmsi'], voyage: myt['voyage'], mode: myt['mode'], vessel: myt['vessel'], latitude: myt['location']['geolocation']['latitude'], longitude: myt['location']['geolocation']['longitude'] )

          
          puts "****"
        end
        puts "------"

      end

      #Bulk upsert
      puts "local_milestones = #{local_milestones.inspect}"
      if local_milestones != []
        my_result = ContainerMilestone.insert_all(local_milestones)
        puts "my_result = #{my_result.inspect}"
      else
        puts "No milestones yet for this container: #{container_id}"
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