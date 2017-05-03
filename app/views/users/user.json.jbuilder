json.user do
    json.(@user, :id, :email)
    if @user.games
        json.last_save @user.games.last.state
    end
end