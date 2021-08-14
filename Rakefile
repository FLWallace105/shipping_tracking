require 'active_record'
require 'sinatra/activerecord/rake'

require_relative 'shipping_tracking'
require_relative 'tracking_ftp'

namespace :request_ftp_info do
    desc 'testing info'
    task :testing_info do |t|
        ShippingInfo::TrackGetter.new.get_ftp_shipping_info
    end

    desc 'stop tracking containers in csv file'
    task :stop_tracking do |t|
        ShippingInfo::TrackGetter.new.stop_tracking

    end

    desc 'find out info for no etas from csv file'
    task :find_out_info_no_etas do |t|
        ShippingInfo::TrackGetter.new.no_etas_container_file

    end

    desc 'start analysis containers no etas'
    task :start_analysis_container_no_eta do |t|
        ShippingInfo::TrackGetter.new.container_no_eta_analysis
    end


    desc 'find out which containers we should be tracking but are not'
    task :find_out_containers_should_track do |t|
        ShippingInfo::TrackGetter.new.containers_should_track_info
    end

    desc 'load container_trackings csv file from production'
    task :load_container_trackings do |t|
        ShippingInfo::TrackGetter.new.load_container_trackings
    end

    desc 'find containers with no milestones and report info'
    task :containers_no_milestomes do |t|
        ShippingInfo::TrackGetter.new.containers_no_milestones
    end

    desc 'find containers with no ETAs'
    task :find_containers_no_etas do |t|
        ShippingInfo::TrackGetter.new.containers_no_etas
    end

    desc 'get csv tracking info from FTP'
    task :get_tracking_info_ftp do |t|
        TrackingFTP.new.pull_tracking_info
    end

    desc 'test vizion api with supplied container id'
    task :testing_vizion do |t|
        ShippingInfo::TrackGetter.new.test_vizion_api
    end

    desc 'call individual reference id to get milestone info'
    task :call_reference_id_milestone, :ref_id, :container_id do |t, args|
        reference_id = args['ref_id']
        container_id = args['container_id']
        ShippingInfo::TrackGetter.new.test_vizion_milestone(reference_id, container_id)
    end

    desc 'test vizion api get update with supplied request id'
    task :testing_vizion_info, :args do |t, args|
        ShippingInfo::TrackGetter.new.test_call_reference_id(*args)
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