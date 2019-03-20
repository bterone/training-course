class UsersController < ApplicationController

    def index
        #@users = User.all
        @users = User.select('users.id','users.fname','users.lname',
        'users.citizenid','users.email','students.studentid','groups.groupname').
        joins(:student).
        left_outer_joins(:groups)
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        case route_to params
        when :outsider
            @user.usertype = :outsider
            if(@user.save)
                render 'confirmation'
            else
                render 'new'
            end

        when :student
            @user.usertype = :student
            if(@user.save)
                @user.update(:student_attributes => student_params)
                render 'confirmation'
            else
                render 'new'
            end
        when :instructor
            @user.usertype = :instructor
            if(@user.save)
                @user.update(:instructor_attributes => instructor_params)
                render 'confirmation'
            else
                render 'new'
            end
        end
    end

    def edit
        @user = User.find(params[:id])
        authorize User
    end

    def update
        @user = User.find(params[:id])

        if(@user.update(user_params))
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @student = @user.student
        @student.destroy
        @user.destroy

        redirect_to users_path
    end

    private def user_params
        params.require(:user).permit(:fname, :lname, :citizenid, :username, :password, :email)
    end

    private def student_params
        params.require(:user).permit(:studentid)
    end

    private def instructor_params
        params.require(:user).permit(:instructorid, :departmentname)
    end

    private def route_to params
        params[:route_to].keys.first.to_sym
    end
end