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
    
end
