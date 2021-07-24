class CreateContainerMilestone < ActiveRecord::Migration[6.1]
  def change
    create_table :container_milestones , force: :cascade do |t|
      t.string :container_id
      t.datetime :milestone_timestamp
      t.string :location_name
      t.string :location_city
      t.string :location_country
      t.string :location_unlocode
      t.string :location_facility
      t.string :description
      t.string :raw_descripition
      t.string :vessel_imo
      t.string :vessel_mmsi
      t.string :voyage
      t.string :mode
      t.string :vessel
      t.string :latitude
      t.string :longitude

    end
    add_index :container_milestones, :container_id

  end
end
