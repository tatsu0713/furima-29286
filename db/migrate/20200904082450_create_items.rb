class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,          foreign_key: true
      t.string :name,              null: false
      t.text :explanation,         null: false
      t.integer :category_id,      null: false
      t.integer :item_status_id,   null: false
      t.integer :item_burden_id,   null: false
      t.integer :delivery_area_id, null: false
      t.integer :shipping_day_id,  null: false
      t.integer :selling_price,    null: false
      t.timestamps
    end
  end
end
