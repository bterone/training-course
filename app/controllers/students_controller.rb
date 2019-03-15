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

    def stgroup
        @course = Course.find(params[:id])
        @group = Group.all.
        left_outer_joins(:users).where(users: { id: current_user.id}, course_id: params[:id])
        @wholegroup = User.all.left_outer_joins(:groups).where(groups: { id: @group })
    end

    def savegroupname(groupname)
        @group = Group.all.
        left_outer_joins(:users).where(users: { id: current_user.id}, course_id: params[:id])
        @wholegroup = User.all.left_outer_joins(:groups).where(groups: { id: @group })
        @wholegroup.groupname << groupname
        if(@wholegroup.save)
            flash[:alert] = "Group name has been saved!"
            redirect_to(request.referrer || root_path)
        else
            flash[:alert] = "Sorry! Something went wrong when saving your name."
            redirect_to(request.referrer || root_path)
        end
    end
    helper_method :savegroupname

    def groupfind(course)
        @group = course.groups
        @group.all.
        left_outer_joins(:users).where(users: { id: current_user.id })
    end
    helper_method :groupfind
end
