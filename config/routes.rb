Rails.application.routes.draw do
  root to: "pages#splash"

  get "https://api.flickr.com/services", as: :flickr_login
  get "/auth/callback", to: "sessions#create"
end
