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

      
    end


    def get_ftp_shipping_info
        puts "starting to get shipping info from ACS FTP site"
        Net::FTP.open(@host, @username, @password, @port) do |ftp|
            files = ftp.list
          
            puts "list out files in root directory:"
            puts files
          end 


    end

  end
end