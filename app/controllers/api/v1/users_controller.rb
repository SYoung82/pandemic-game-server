class Api::V1::UsersController < ApplicationController

    def show
        @user = User.find(params[:id])

        binding.pry
        if @user
            render json: @user
        else
            render json: {
                errors: @user.errors
            }, status: 500
        end
    end

    def create

    end
    
end