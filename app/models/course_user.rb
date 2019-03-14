class CourseUser < ApplicationRecord
    belongs_to :user
    belongs_to :course

    validates_uniqueness_of :user, scope: :course, message: "Already following this course!"
end
