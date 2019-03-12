class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :citizenid, :null => false
      t.string :email
      t.references :usertype, foreign_key: true

      ## Database authenticatable
      t.string :username,           null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.index :citizenid, unique: true
    end
    add_index :users, :username,             unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
