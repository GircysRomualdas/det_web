class CreateFindDetailPreps < ActiveRecord::Migration[7.0]
  def change
    create_table :find_detail_preps do |t|
      t.belongs_to :order_prep
      t.integer :detail_id
      t.integer :car_id
      t.string :car_name
      t.integer :supplier_id
      t.string :supplier_name
      t.integer :order_type_id
      t.string :order_type_name
      t.string :delivery_days
      t.string :code
      t.string :name                          , limit: 50
      t.string :comment           ,default: "", limit: 50
      t.float :price
      t.float :price_with_tax
      t.integer :quantity

      t.timestamps
    end
  end
end
