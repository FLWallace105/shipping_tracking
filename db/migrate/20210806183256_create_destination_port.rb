class CreateDestinationPort < ActiveRecord::Migration[6.1]
  def change
    create_table :destination_ports , force: :cascade do |t|
      t.string :container_id
      t.string :port_name
      t.string :city
      t.string :state
      t.string :unlocode
      t.string :facility
      t.string :latitude
      t.string :longitude


    end
    add_index :destination_ports, :port_name
    execute 'CREATE UNIQUE INDEX dest_cont_ports on destination_ports(container_id, port_name );'

  end

end


