class CreateShippingLinesScacCode < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_lines_scac_codes , force: :cascade do |t|
      
      t.bigint :carrier_code
      t.string :scac_code



    end
    

  end
end
