Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "forecast", to: "forecast#index"
      post "users", to: "users#create"
      get "users/:id", to: "users#show"
      get "backgrounds", to: "backgrounds#index"
    end
  end
end
