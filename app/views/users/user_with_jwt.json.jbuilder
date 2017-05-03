json.user do
    json.(@user, :id, :email)
end
json.token(JWT.encode({user_id: @user.id}, ENV['AUTH_SECRET'], ENV['AUTH_ALGORITHM']))