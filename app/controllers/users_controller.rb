class UsersController < ApplicationController
    def new

    end

    def show
        #Couldn't find User with 'citizenid'=
        #@user = User.find(params[:user])
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
                render plain: params[:user].inspect
            end
        when :student
            #render plain: params[:user].inspect
        when :instructor
            #render 'login'
        end

        @user.save
    end

    private def user_params
        params.require(:user).permit(:fname, :lname, :citizenid, :username, :password, :email)
    end

    private def route_to params
        params[:route_to].keys.first.to_sym
    end
end