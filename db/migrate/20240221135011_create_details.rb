class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.belongs_to :order
      t.string :part_name       , limit: 50
      t.string :part_code
      t.string :comment        , limit: 50
      t.string :kiekis
      t.integer :qnt
      t.float :our_price
      t.integer :supplier_id
      t.string :supplier
      t.float :price_wo_tax_all
      t.float :price_with_tax
      t.string :status
      t.integer :status_id
      t.integer :inovice_count
      t.integer :woinovice_count
      t.string :icon
      t.string :qnt_confirmed
      t.float :onepart_price_with_tax
      t.string :qnt_packed
      
      t.timestamps
    end
  end
end