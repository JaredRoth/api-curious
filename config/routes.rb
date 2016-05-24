Rails.application.routes.draw do
  root to: "pages#splash"

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
end
