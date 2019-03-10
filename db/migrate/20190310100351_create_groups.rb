class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :groupname
      t.text :submission
      t.text :review
      t.integer :grade
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
