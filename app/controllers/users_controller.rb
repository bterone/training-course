class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        #Couldn't find User with 'citizenid'=
        #@user = User.find(params[:user])
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        case route_to params
        when :outsider
            usertype = Usertype.find(1)
            @user.usertype = usertype
            #render plain: params[:user].inspect
            if(@user.save)
                redirect_to @user
            else
                #render plain: params[:user].inspect
                render 'new'
            end

        when :student
            usertype = Usertype.find(2)
            @user.usertype = usertype
            if(@user.save)
                @user.update(:student_attributes => student_params)
                redirect_to @user
            else
                render 'new'
            end
        when :instructor
            usertype = Usertype.find(3)
            @user.usertype = usertype
            if(@user.save)
                @user.update(:instructor_attributes => instructor_params)
                redirect_to @user
            else
                render 'new'
            end
        end
    end

    private def user_params
        params.require(:user).permit(:fname, :lname, :citizenid, :username, :password, :email)
    end

    private def student_params
        params.require(:user).permit(:studentid)
    end

    private def instructor_params
        params.require(:user).permit(:instructorid)
    end

    private def route_to params
        params[:route_to].keys.first.to_sym
    end
end