# Shipping Tracking Script

- [x] Basic Connectivity to ACS ELLIE INFLUENCER FTP.
- [x] Connect to Shipping Tracking FTP with username/password/port.
- [x] consume information for shipping tracking from FTP Site.
- [x] Input file from FTP: if there is no Master BOL the row is skipped (see below)
- [x] Save consumed information to database.
- [x] Use database tables to request information from VizionAPI and save data.
- [x] Process Vizion API data and convert to form needed for ACS.
- [x] Export above data into ACS FTP site.
- [x] Export an estimated time of arrival milestone in separate file for all containers where this exists.
- [ ] Export milestone history for each container as a separate file.
- [ ] Mark container_trackings with journey_finished = TRUE after upload to FTP site and some processing finished condition.
- [ ] When journey is finished, cancel/release the Vizion Reference per their request.
- [ ] Make the CSV ftp export include the longitude and latitude data. It exists in the table but the current code bombs out when trying to write to the outbound csv file.
- [ ] Make the app timezone aware. Currently the app strips out timezone information.


## Notes: 
This is .env driven for configuration and run by cron jobs. Code refactoring should be implemented at some point, and there is room for conversion into a full Rails project to not only have the current ACS via FTP mode of pulling and pushing data, but user allowed download of CSV data including prior milestones per container for full history as well as the last current milestone, similar to the Influencer app and its download of CSVs to users.

* Full history of container_milestones is potentially available (data exists) but is not implemented.
* Method TrackingFTP.new.pull_tracking_info will not "clean" data, nor will it send back to ACS rows that have no Master BOL and thus cannot have a Vizion API tracking request created (as there would be no scac code).
* Method TrackingFTP.new.pull_tracking_info will not check for duplicates in the input file.
* Current codebase does minimal data cleaning and depends on Master BOL to exist and have first four characters indicate scac code.
* Current codebase depends entirely on the input file created by ACS having current row headings etc.
* Parent/Child relationship in the models container_tracking.rb and container_milestone.rb have yet to be implemented.
* There is no "cleanup" of old, outmoded data for both the container_milestones table and container_trackings table. Not an issue at launch but should be done to enhance performance with lots of data in the tables.

### Rake Files:

Below are the rake files, the order in which they operate is important. The order is:

1. rake request_ftp_info:get_tracking_info_ftp #This will pull down the CSV export created by ACS and add the data to the table container_trackings from which all trackings depend. It should match in frequency when ACS puts data on the 'Outbound' FTP directory.

2. rake request_ftp_info:create_vizion_tracking_reference #This will create a tracking reference for the container where one does not already exist. This should run a few minutes after the above rake task pulls in new container_ids and new scac codes (from the Master BOL)

3. rake request_ftp_info:get_milestones_container_tracking #This will get the latest milestones for any container via the Vizion API and update the container_milestones table with tracking data. This should run every 3 hours or so.

4. rake request_ftp_info:upload_tracking_file #This will upload first the Last_milestone_container_tracking_xxxx.csv file, and then second the Estimated_arrival_conntainer_tracking_xxxx.csv file, where the xxx is date/time data. This should run around 6 AM, 12 pm, and 6 pm or so.

```ruby
rake request_ftp_info:create_vizion_tracking_reference   # create Vizion API tracking references for container tr...
rake request_ftp_info:get_milestones_container_tracking  # get milestones from Vizion from container_tracking table
rake request_ftp_info:get_tracking_info_ftp              # get csv tracking info from FTP
rake request_ftp_info:load_in_shipping_scac_code_list    # load in shipping code list and scac code list
rake request_ftp_info:testing_info                       # testing info
rake request_ftp_info:testing_vizion                     # test vizion api with supplied container id
rake request_ftp_info:testing_vizion_info                # test vizion api get update with supplied request id
rake request_ftp_info:upload_tracking_file               # upload tracking file to FAM FTP server
#Fix above with more info


```

## Overview:
This is a very simple plain old Ruby script running from rake tasks that in production will be cron jobs using the gemset wrapper from rvm. The file tracking_ftp.rb inherits from Net::FTP and creates a few methods inside to handle both downloading the input file and processing it (saving to database table container_trackings) and using the container_trackings table and the child container_milestones table to push a CSV file to the FTP endpoint for ACS to consume.

The file shipping_tracking.rb handles the access to the Vizion API endpoints to both create a reference (used to call data from Vizion) and use the reference to access container milestones and save to the container_milestone table. 

