class Api::V1::UsersController < ApplicationController
    before_action :authenticate_token!, only: [:show]

    def show
        @user = nil
        if current_user.id.to_s == params[:id]
            @user = User.find(params[:id])
        end

        if @user.id.to_s == params[:id]
            render 'users/user.json.jbuilder', user: @user
        else
            render json: {
                errors: 'Invalid credentials to view this user.'
            }, status: 500
        end
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render 'users/user_with_jwt.json.jbuilder', user: @user
        else
            render json: {
                errors: @user.errors
            }, status: 500
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
    
end