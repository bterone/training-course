class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: false do |t|
      t.primary_key :studentid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
