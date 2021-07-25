class TrackingFTP < Net::FTP
  Dotenv.load

  Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }
  Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

    def initialize
      @url = ENV['TRACKING_FTP_HOST']
      @username = ENV['TRACKING_FTP_USERNAME']
      @password = ENV['TRACKING_FTP_PASSWORD']
      @port = ENV['TRACKING_FTP_PORT']
      super
      puts "#{@url}, #{@port}"
      puts "#{@username}, #{@password}"
      connect(@url, @port)
      login(@username, @password)
    end

    def pull_tracking_info
        directory = '/Outbound'
        puts "Polling tracking FTP server: #{directory}"
        chdir directory
        # in production match against: ORDERTRK, when manually testing match against TEST
        mlsd.select { |entry| entry.type == 'file' && /.csv/.match?(entry.pathname) }.each do |entry|
          puts "Found #{entry.pathname}"
          process_tracking_csv(entry.pathname)
          #here move files to Archive
          move_file_to_archive(entry.pathname)
        end
    end


    def process_tracking_csv(path)
        puts "Starting Tracking CSV processing of #{path}"
        #tracking_data = get_tracking_csv(path)

        myfile_data = getbinaryfile(path, nil)
        puts myfile_data.inspect
        puts "------"
        puts myfile_data
        mynew_csv = CSV.new(myfile_data, headers: true)
        puts mynew_csv.inspect
        mynew_csv.each do |row|
            puts row.inspect
            #check to see if Master BOL is null or not, then grab first four chars to set scac code
            master_bill_lading = row['MASTER BOL']
            if master_bill_lading == "" || master_bill_lading.nil?
              puts "Master Bill of Lading Field is null, not processing"
              next
            end
            shipping_company = master_bill_lading[0..3]
            #check to see if this is a supported scac code, otherwise next
            my_scac_code = ShippingLineScacCode.where("scac_code = ?", shipping_company)
            puts "my_scac_code = #{my_scac_code.inspect}"
            if my_scac_code == nil || my_scac_code == []
              puts "That scac code is not supported by Vizion API, moving to next row"
              next
            end
            container_id = row['Container #']
            if container_id != nil && container_id !~ /\//i
              my_container = ContainerTracking.find_by_container_id(container_id)
              if my_container != nil
                puts "Not creating new record"
              else
                ContainerTracking.create(shipping_company: shipping_company, container_id: container_id, bill_of_lading: master_bill_lading)
              end
            else
              puts "container_id = #{container_id}, bad data, skipping this row."
            end
        end
           
    end

    def move_file_to_archive(path)
      begin
        puts "Archiving #{path} on FTP server"
        pathname = Pathname.new path
        rename(path, pathname.dirname + 'Archive' + pathname.basename)
      rescue Net::FTPPermError => e
        puts e
        puts 'Archive file exists already or cannot be overwritten. Removing original.'
        delete path
      end
    end


end