module EtaFinder

    def determine_eta(raw_description, new_temp_city, my_destination_city, is_planned, container_id)
        puts "Determing ETA"
        eta_found = false
        carrier_info = ContainerTracking.find_by_container_id(container_id)
        carrier_code = carrier_info.shipping_company
        case raw_description
            when /estim.+/i
                eta_found = true
            when /vessel\sarrive.+destination\sport/i
                eta_found = true
            when /arriv.+port/i
                eta_found = true
            when /train.+arriv.+import/i
                eta_found = true
            when   /.+ pod\sberth.+dest.+/i  && carrier_code == 'ONEY'
                eta_found = true
            when (my_destination_city != nil  && new_temp_city != nil) && (new_temp_city.downcase == my_destination_city.downcase) && (is_planned == true)
                eta_found = true
            else
                eta_found = false
            
        end

        puts "ETA is #{eta_found}"
        return eta_found


    end



end