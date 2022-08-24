Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "api#show"
  get "/api", to: "api#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
