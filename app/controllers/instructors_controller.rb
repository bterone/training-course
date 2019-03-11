class InstructorsController < ApplicationController
    def indashboard
        @courses = Course.all
    end

    def inassign
        @course = Course.find(params[:id])
        @groups = @course.groups.all
        #@users = @groups.joins("LEFT OUTER JOIN group_users ON groups.id = group_users.group_id LEFT OUTER JOIN users ON group_users.user_id = users.id")
        #sql = "SELECT users.fname, users.lname, groups.groupname
        #    FROM users
        #LEFT OUTER JOIN group_users
        #    ON users.id = group_users.user_id
        #LEFT OUTER JOIN groups
        #    ON group_users.group_id = groups.id"
        #@users = ActiveRecord::Base.connection.exec_query(sql)
        @users = User.all
        @userselected = User.select('users.fname','users.lname','groups.groupname').
        left_outer_joins(:group_users).
        left_outer_joins(:groups).all
    end
end
