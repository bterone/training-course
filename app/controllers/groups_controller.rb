class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        @group = Group.find(params[:id])
        if(@group.update(group_params))
            flash[:alert] = "Group name has been saved!"
            redirect_to(request.referrer || root_path)
        else
            flash[:alert] = "Group name has been saved!"
            redirect_to(request.referrer || root_path)
        end
    end

    def submission
        @group = Group.find(params[:id])
    end

    
    def spawn
        Group.create(groupname: "New Group", submission: "NONE", review: "NONE", grade: 100, course_id: params[:id])
        indashboard_path
    end
    #helper_method :creategroup

    private def group_params
        params.require(:group).permit(:groupname, :submission, :id)
    end
end
