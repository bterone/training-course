class InstructorsController < ApplicationController
    def indashboard
        @courses = Course.all
    end

    def inassign
        @course = Course.find(params[:id])
        @groups = @course.groups.all
        @users = @groups.joins(:users)
    end
end
