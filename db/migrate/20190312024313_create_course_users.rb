class CreateCourseUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :course_users do |t|
      
      t.integer :user_id
      t.integer :course_id

    end
  end
end
