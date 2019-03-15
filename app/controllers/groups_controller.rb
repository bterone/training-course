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

    private def group_params
        params.require(:group).permit(:groupname, :submission)
    end
end
