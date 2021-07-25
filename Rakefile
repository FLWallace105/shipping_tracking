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

    desc 'load in shipping code list and scac code list'
    task :load_in_shipping_scac_code_list do |t|
        ShippingInfo::TrackGetter.new.load_in_shipping_lines_info
    end

    desc 'create Vizion API tracking references for container tracking table'
    task :create_vizion_tracking_reference do |t|
        ShippingInfo::TrackGetter.new.create_vizion_references_from_container_trackings
    end

    desc 'get milestones from Vizion from container_tracking table'
    task :get_milestones_container_tracking do |t|
        ShippingInfo::TrackGetter.new.create_milestones_from_container_tracking
    end

    desc 'upload tracking file to FAM FTP server'
    task :upload_tracking_file do |t|
        TrackingFTP.new.upload_tracking_file_ftp
    end
    


end