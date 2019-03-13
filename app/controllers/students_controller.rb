class StudentsController < ApplicationController
    def stdashboard
        #@courses = Course.all

        @courses = Course.all.
        left_outer_joins(:users).where(users: { id: current_user.id})

        # Need to find all the groups in the course with our userID
        #@group = Group.all.
        #left_outer_joins(:users).where(users: { id: current_user.id})
    end

    def stoverview
        @course = Course.find(params[:id])
    end

    def mymethod(course)
        @group = course.groups
        @group.all.
        left_outer_joins(:users).where(users: { id: current_user.id })
    end
    helper_method :mymethod
end
