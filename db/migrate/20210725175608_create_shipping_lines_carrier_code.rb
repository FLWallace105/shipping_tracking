class CreateShippingLinesCarrierCode < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_lines_carrier_codes , force: :cascade do |t|
      t.string :carrier_name
      t.bigint :carrier_id
      t.string :carrier_code



    end
    add_index :shipping_lines_carrier_codes, :carrier_code

  end
end
