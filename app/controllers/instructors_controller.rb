class InstructorsController < ApplicationController
    def indashboard
        @courses = Course.all
        authorize Course
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

        @users = User.all.
        left_outer_joins(:courses).where(course_users: { course_id: params[:id]})

        @userselected = @users.select('users.fname','users.lname','groups.groupname').
        left_outer_joins(:groups).all
        authorize Course
    end

    def inoverview
        @course = Course.find(params[:id])

        @users = User.all.
        left_outer_joins(:courses).where(course_users: { course_id: params[:id]})

        @userselected = @users.select('users.fname','users.lname','groups.groupname').
        left_outer_joins(:groups).where(usertype: 1)

        #SELECT COUNT(users.fname), groups.groupname FROM users 
        #LEFT OUTER JOIN "group_users" ON "group_users"."user_id" = "users"."id" 
        #LEFT OUTER JOIN "groups" ON "groups"."id" = "group_users"."group_id" WHERE "users"."usertype" = 1 GROUP BY groups.groupname 
        
        @groupcount = @userselected.group('groups.groupname').count('users.fname')
        authorize Course
    end
end
