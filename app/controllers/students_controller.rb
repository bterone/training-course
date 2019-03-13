class StudentsController < ApplicationController
    def stdashboard
        #@courses = Course.all

        @courses = Course.all.
        left_outer_joins(:users).where(users: { id: current_user.id})
    end

    def stoverview
        @course = Course.find(params[:id])
    end
end
