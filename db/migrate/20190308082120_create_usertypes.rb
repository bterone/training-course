class CreateUsertypes < ActiveRecord::Migration[5.1]
  def change
    create_table :usertypes do |t|
      t.string :usertype

      t.timestamps
    end
  end
end
