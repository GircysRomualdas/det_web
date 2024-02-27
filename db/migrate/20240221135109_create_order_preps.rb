class CreateOrderPreps < ActiveRecord::Migration[7.0]
  def change
    create_table :order_preps do |t|
      t.belongs_to :user
      t.belongs_to :brand

      t.timestamps
    end
  end
end
