# Shipping Tracking Script

- [x] Basic Connectivity to ACS ELLIE INFLUENCER FTP.
- [x] Connect to Shipping Tracking FTP with username/password/port.
- [x] consume information for shipping tracking from FTP Site.
- [x] Input file from FTP: if there is no Master BOL the row is skipped (see below)
- [x] Save consumed information to database.
- [x] Use database tables to request information from VizionAPI and save data.
- [x] Process Vizion API data and convert to form needed for ACS.
- [x] Export above data into ACS FTP site.
- [ ] Mark container_trackings with journey_finished = TRUE after upload to FTP site and some processing finished condition.
- [ ] Make the CSV ftp export include the longitude and latitude data. It exists in the table but the current code bombs out when trying to write to the outbound csv file.


## Notes: 
This is .env driven for configuration and run by cron jobs. Code refactoring should be implemented at some point, and there is room for conversion into a full Rails project to not only have the current ACS via FTP mode of pulling and pushing data, but user allowed download of CSV data including prior milestones per container for full history as well as the last current milestone, similar to the Influencer app and its download of CSVs to users.

* Full history of container_milestones is potentially available (data exists) but is not implemented.
* Method TrackingFTP.new.pull_tracking_info will not check for duplicates in the input file.
* Current codebase does minimal data cleaning and depends on Master BOL to exist and have first four characters indicate scac code.
* Current codebase depends entirely on the input file created by ACS having current row headings etc.
* Parent/Child relationship in the models container_tracking.rb and container_milestone.rb have yet to be implemented.
* There is no "cleanup" of old, outmoded data for both the container_milestones table and container_trackings table. Not an issue at launch but should be done to enhance performance with lots of data in the tables.

## Overview:
This is a very simple plain old Ruby script running from rake tasks that in production will be cron jobs using the gemset wrapper from rvm. The file tracking_ftp.rb inherits from Net::FTP and creates a few methods inside to handle both downloading the input file and processing it (saving to database table container_trackings) and using the container_trackings table and the child container_milestones table to push a CSV file to the FTP endpoint for ACS to consume.

The file shipping_tracking.rb handles the access to the Vizion API endpoints to both create a reference (used to call data from Vizion) and use the reference to access container milestones and save to the container_milestone table. 

