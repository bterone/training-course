class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :coursename
      t.text :coursedesc

      t.timestamps
    end
  end
end
