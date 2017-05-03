class Api::V1::GamesController < ApplicationController
    before_action :authenticate_token!, only: [:show, :index]

    def index
        @games = Game.find_by(user_id: params[:user_id])

        if @games
            render json: @games
        else
            render json: {
                errors: @games.errors
            }, status: 500
        end
    end

    def show

    end
    
end
