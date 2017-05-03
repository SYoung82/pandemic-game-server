class Api::V1::UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        
        if @user
            render @user
        else
            render json: {
                errors: @user.errors
            }, status: 500
        end
    end
end