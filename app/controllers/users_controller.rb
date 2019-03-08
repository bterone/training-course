class UsersController < ApplicationController
    def new

    end

    def show
        #Couldn't find User with 'citizenid'=
        #@user = User.find(params[:user])
        @user = User.where(citizenid: "C012345678")
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
            usertype = Usertype.find(2)
            @user.usertype = usertype
            if(@user.save)
                redirect_to @user
            else
                render plain: params[:user].inspect
            end
        when :instructor
            usertype = Usertype.find(3)
            @user.usertype = usertype
            if(@user.save)
                redirect_to @user
            else
                render plain: params[:user].inspect
            end
        end
    end

    private def user_params
        params.require(:user).permit(:fname, :lname, :citizenid, :username, :password, :email)
    end

    private def route_to params
        params[:route_to].keys.first.to_sym
    end
end