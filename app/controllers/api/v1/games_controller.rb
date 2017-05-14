class Api::V1::GamesController < ApplicationController
    before_action :authenticate_token!, only: [:show, :index]

    def index
        if current_user.id.to_s == params[:user_id]
            @games = Game.where(user_id: params[:user_id])
        end
        
        if @games
            render json: @games
        else
            render json: {
                errors: 'Invalid credentials to view these games'
            }, status: 500
        end
    end

    def show

    end
    
    def create
        @user = User.find(params[:user_id])

        if @user
            @user.games.create(game_params)
            render 'users/user.json.jbuilder'
        else
            render json: {
                errors: @user.errors
            }, status: 500
        end
    end
    
    private

        def game_params
            params.require(:state).permit!.permit!.permit!.permit!
        end
        
end
