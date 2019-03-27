class FilterController < ApplicationController
    def show
        @selectedusers = User.select('users.id','users.fname','users.lname',
        'users.citizenid','users.email','students.studentid','groups.groupname').
        joins(:student).
        left_outer_joins(:groups)

        @users = @selectedusers.where('users.fname LIKE ? AND users.lname LIKE ? AND users.citizenid
        LIKE ? AND users.email LIKE ? AND students.studentid LIKE ? AND (groups.groupname LIKE ? OR groups.groupname IS NULL)',
        "#{params[:fname]}%", "#{params[:lname]}%", "#{params[:citizenid]}%", "#{params[:email]}%", "#{params[:studentid]}%", "#{params[:groupname]}%")
    end

    def filtering_params(params)
        params.require(:filter).permit(:studentid, :fname, :lname, :citizenid, :email, :groupname)
    end
end
