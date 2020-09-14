class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :post_number,       null: false
      t.integer :delivery_area_id, null: false
      t.string :municipality,      null: false
      t.string :address,           null: false
      t.string :building
      t.string :phone_number,      null: false
      t.timestamps   
    end
  end
end
