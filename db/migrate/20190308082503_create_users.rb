class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.string :fname
      t.string :lname
      t.primary_key :citizenid
      t.string :username
      t.string :password
      t.string :email
      t.references :usertype, foreign_key: true

      t.timestamps
    end
  end
end
