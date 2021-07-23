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

    def test_call_reference_id
      #curl --location --request GET 'https://demo.vizionapi.com/references/905c8e59-631d-4338-9e47-0fca2d6ee61c/updates' \
      #--header 'X-API-Key: yourApiKey'
      reference_id = "5fd35ba9-2a08-4a4a-9959-7f4f5db1d341"

      my_reference_info = HTTParty.get("#{@base_vizion_url}/references/#{reference_id}", :headers => @my_basic_header, :timeout => 80)
      puts my_reference_info.inspect


    end


  end
end