class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :studentid, :null => false
      t.references :user, foreign_key: true

      t.index :studentid, unique: true
      t.timestamps
    end
  end
end
