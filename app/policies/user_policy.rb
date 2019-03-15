class UserPolicy < ApplicationPolicy
    attr_reader :user

    def initialize(user, course)
        @user = user
    end

    def edit?
        user.instructor?
    end
end