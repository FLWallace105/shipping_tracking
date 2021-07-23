require 'active_record'
require 'sinatra/activerecord/rake'

require_relative 'shipping_tracking'
require_relative 'tracking_ftp'

namespace :request_ftp_info do
    desc 'testing info'
    task :testing_info do |t|
        ShippingInfo::TrackGetter.new.get_ftp_shipping_info
    end

    desc 'get csv tracking info from FTP'
    task :get_tracking_info_ftp do |t|
        TrackingFTP.new.pull_tracking_info
    end

    desc 'test vizion api with supplied container id'
    task :testing_vizion do |t|
        ShippingInfo::TrackGetter.new.test_vizion_api
    end

    desc 'test vizion api get update with supplied request id'
    task :testing_vizion_info do |t|
        ShippingInfo::TrackGetter.new.test_call_reference_id
    end



end