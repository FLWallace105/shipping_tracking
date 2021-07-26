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


## Notes: 
This is .env driven for configuration and run by cron jobs. Still skeleton form.

* Method TrackingFTP.new.pull_tracking_info will not check for duplicates in the input file.
* Current codebase does minimal data cleaning and depends on Master BOL to exist and have first four characters indicate scac code.
* Current codebase depends entirely on the input file created by ACS having current row headings etc.

