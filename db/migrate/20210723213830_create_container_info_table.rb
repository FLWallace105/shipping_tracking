class CreateContainerInfoTable < ActiveRecord::Migration[6.1]
  def change
    create_table :container_trackings , force: :cascade do |t|
      t.string :container_id
      t.string :shipping_company
      t.string :vizion_reference_id
      t.string :vision_organization_id
      t.string :bill_of_lading
      t.jsonb :latest_status
      t.timestamps
      t.boolean :finished_journey


    end
  end
end
