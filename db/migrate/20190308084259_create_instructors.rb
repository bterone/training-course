class CreateInstructors < ActiveRecord::Migration[5.1]
  def change
    create_table :instructors do |t|
      t.string :instructorid, :null => false
      t.references :user, foreign_key: true

      t.index :instructorid, unique: true
      t.timestamps
    end
  end
end
