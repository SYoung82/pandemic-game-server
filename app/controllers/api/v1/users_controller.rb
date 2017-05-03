class Api::V1::UsersController < ApplicationController

    def show
        @user = User.find(params[:id])

        if @user
            render json: @user
        else
            render json: {
                errors: @user.errors
            }, status: 500
        end
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render 'users/user.json.jbuilder', user: @user
        else
            render json: {
                @user.errors
            }, status: 500
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
    
end