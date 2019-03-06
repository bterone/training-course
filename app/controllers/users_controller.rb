class UsersController < ApplicationController
    def new

    end

    def create
        case route_to params
        when :outsider
            render plain: params[:user].inspect
        when :student
            render plain: params[:user].inspect
        when :instructor
            render 'login'
        end
    end

    private def route_to params
        params[:route_to].keys.first.to_sym
    end
end