class Api::V1::AuthController < ApplicationController
    before_action :authenticate_token!, only: [:refresh]

    def login
        @user = User.find_by(email: params[:email])
        
        if !@user
            render json: {
                errors: {
                    email: "Unable to find user with provided email address"
                }
            }, status: 500
        elsif @user && @user.authenticate(params[:password])
            render 'users/user_with_jwt.json.jbuilder', user: @user
        else
            render json: {
                errors: {
                    password: 'Password does not match the provided email'
                }
            }, status: 500
        end
    end
    
    def refresh
        render 'users/user_with_jwt.json.jbuilder', user: @user
    end
    
end
