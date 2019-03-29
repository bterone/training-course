class InstructorsController < ApplicationController
    def indashboard
        @courses = Course.all
        authorize Course
    end

    def inassign
        @course = Course.find(params[:id])
        @groups = @course.groups.all

        @users = User.all.
        left_outer_joins(:courses).where(course_users: { course_id: params[:id]})

        @userselected = @users.select('users.id','users.fname','users.lname','groups.groupname').
        left_outer_joins(:groups).all
        authorize Course
    end

    def inoverview
        @course = Course.find(params[:id])

        @users = User.all.
        left_outer_joins(:courses).where(course_users: { course_id: params[:id]})

        @userselected = @users.select('users.fname','users.lname','groups.groupname').
        left_outer_joins(:groups).where(usertype: 1)

        @groupcount = @userselected.group('groups.groupname').count('users.fname')
        authorize Course
    end
end
