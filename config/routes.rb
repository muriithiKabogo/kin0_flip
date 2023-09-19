Rails.application.routes.draw do
  get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/search", to: "search#search"
  # Defines the root path route ("/")
  root "homes#index"


end
