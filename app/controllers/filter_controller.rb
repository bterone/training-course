class FilterController < ApplicationController
    def show
        @selectedusers = User.select('users.id','users.fname','users.lname',
        'users.citizenid','users.email','students.studentid','groups.groupname').
        joins(:student).
        left_outer_joins(:groups)

        @users = @selectedusers.where('users.fname LIKE ? AND users.lname LIKE ? AND users.citizenid
         LIKE ? AND users.email LIKE ? AND students.studentid LIKE ? AND groups.groupname LIKE ?',
         :user.fname, params[.lname, :user.citizenid, :user.email, :user.studentid, :user.groupname)
        #filtering_params(params).each do |key, value|
        #    @users = @users.public_send(key, value) if value.present?
        #end
    end

    def filtering_params(params)
        #params.slice(:studentid, :fname, :lname, :citizenid, :email, :groupname)
        params.require(:user).permit(:studentid, :fname, :lname, :citizenid, :email, :groupname)
    end
end
