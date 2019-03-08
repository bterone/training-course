class UsersController < ApplicationController
    def new

    end

    def create
        @user = User.new(user_params)
        

        case route_to params
        when :outsider
            render plain: params[:user].inspect
        when :student
            #render plain: params[:user].inspect
        when :instructor
            #render 'login'
        end

        @user.save
    end

    private def user_params
        params.require(:user).permit(:fname, :lname, :citizenid, :username, :password, :email, :usertype)
    end

    private def route_to params
        params[:route_to].keys.first.to_sym
    end
end