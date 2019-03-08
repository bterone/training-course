class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :citizenid, :null => false
      t.string :username
      t.string :password
      t.string :email
      t.references :usertype, foreign_key: true

      t.index :citizenid, unique: true
      t.timestamps
    end
  end
end
