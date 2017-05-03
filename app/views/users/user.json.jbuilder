json.user do
    json.(@user, :id, :email)
    json.last_save @user.games.last.state
end