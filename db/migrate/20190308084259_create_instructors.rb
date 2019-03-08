class CreateInstructors < ActiveRecord::Migration[5.1]
  def change
    create_table :instructors, id: false do |t|
      t.primary_key :instructorid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
