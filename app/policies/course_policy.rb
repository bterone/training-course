class CoursePolicy < ApplicationPolicy
    attr_reader :user, :course

    def initialize(user, course)
        @user = user
        @course = course
    end

    def indashboard?
        user.instructor?
    end

    def inassign?
        user.instructor?
    end

    def inoverview?
        user.instructor?
    end
end