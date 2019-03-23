class StudentsController < ApplicationController
    def stdashboard
        @courses = Course.all.
        left_outer_joins(:users).where(users: { id: current_user.id})
    end

    def stoverview
        @course = Course.find(params[:id])
    end

    def stgroup
        @course = Course.find(params[:id])
        @group = Group.all.
        left_outer_joins(:users).where(users: { id: current_user.id}, course_id: params[:id])
        @wholegroup = User.all.left_outer_joins(:groups).where(groups: { id: @group })
    end

    def groupfind(course)
        @group = course.groups
        @group.all.
        left_outer_joins(:users).where(users: { id: current_user.id })
    end
    helper_method :groupfind
end
