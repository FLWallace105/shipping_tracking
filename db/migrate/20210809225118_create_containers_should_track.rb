class CreateContainersShouldTrack < ActiveRecord::Migration[6.1]
  def change
    create_table :containers_should_tracks , force: :cascade do |t|
      t.string :container_id
      t.string :shipping_company
      
      t.string :bill_of_lading
      
      t.timestamps
      


    end

  end
end
