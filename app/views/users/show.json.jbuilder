json.(@user, :email, :sign_in_count, :last_sign_in_at, :created_at, :admin)
json.translations @user.translations, :name, :language