class UsersController < Devise::RegistrationsController

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
            @user.usertype = :outsider
            #render plain: params[:user].inspect
            if(@user.save)
                render 'confirmation'
            else
                #render plain: params[:user].inspect
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