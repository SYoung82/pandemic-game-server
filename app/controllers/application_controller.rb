class ApplicationController < ActionController::API

    helper_method :authenticate_token!, :current_user

    private

    def authenticate_token!
        if request.env['HTTP_AUTHORIZATION']
            begin
                token = request.env['HTTP_AUTHORIZATION'].split(" ").last
                decoded_token = JWT.decode(token, ENV['AUTH_SECRET']), true, {algorithm: ENV['AUTH_ALGORITHM']})
                @user_id = decoded[0]["user_id"]
            rescue JWT::DecodeError
                errors = [{message: "Token is invalid."}]
            end

            if !current_user || !decoded || errors
                render json: {
                    errors: errors
                }, status: 403
            end
        else
            render json: {
                errors: [
                    { message: 'You must include JWT authorization token' }
                ]
            }, status: 403
    end
    
    def current_user
        @user ||= User.find_by(id: @user_id) if @user_id
    end
    
end
