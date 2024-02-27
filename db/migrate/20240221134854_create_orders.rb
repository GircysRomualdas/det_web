class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :sid
      t.integer :client_id
      t.string :client
      t.string :vehicle_brand
      t.string :vehicle_model
      t.string :vin
      t.string :status
      t.datetime :creation_date
      t.string :color
      t.string :icon
      t.string :supplierlist
      t.string :codelist
      t.datetime :dtcreation_date
      t.float :sum_price_wo_tax_all
      t.integer :count_ordered_parts
      t.integer :count_canceled_parts
      t.integer :count_changed_price_parts
      
      t.timestamps
    end
  end
end
