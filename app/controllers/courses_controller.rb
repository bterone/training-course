class CoursesController < ApplicationController
    def dashboard
        @courses = Course.all
    end

    def show
        @course = Course.find(params[:id])
    end
end
