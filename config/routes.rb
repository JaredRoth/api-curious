Rails.application.routes.draw do
  root to: "pages#splash"

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"

  resource :users, only: [:show]
  get "/profile/following", to: "users#following", as: :following
  get "/profile/following/:username", to: "users#activity", as: :following_activity
end
