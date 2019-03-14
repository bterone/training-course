class CoursesController < ApplicationController
    def show
        @course = Course.find(params[:id])
    end

    def index
        @courses = Course.all
    end

    def follow
        @course = Course.find(params[:id])
        @followcourse = User.find(current_user.id)
        @followcourse.courses << @course
        @followcourse.save
        stdashboard_path
    end
end
