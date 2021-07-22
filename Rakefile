require 'active_record'
require 'sinatra/activerecord/rake'

require_relative 'shipping_tracking'

namespace :request_ftp_info do
    desc 'get shipping container info from ACS FTP'
    task :get_ftp_info do |t|
        ShippingInfo::TrackGetter.new.get_ftp_shipping_info
    end

end