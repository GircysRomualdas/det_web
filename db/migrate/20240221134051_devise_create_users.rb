class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.timestamps null: false

      t.integer :company_id           ,default: ""
      t.string  :company_name         ,default: ""
      t.integer :surcharge_id         ,default: ""
      t.string  :surcharge_name       ,default: ""
      t.integer :is_foreign_customer  
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
