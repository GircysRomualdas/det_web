class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.integer :brand_id
      t.string :name
      t.integer :group_id

      t.timestamps
    end
  end
end
