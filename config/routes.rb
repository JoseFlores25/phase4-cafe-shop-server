Rails.application.routes.draw do
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"

  # User routes
  resources :users, only: [:index, :create, :update, :destroy]
  # Feedback routes
  resources :feedbacks, only: [:index, :create, :destroy]
  # Coffee routes
  resources :coffees, only: [:index, :create, :update]
  # Topping routes
  resources :toppings, only: [:index, :create]

end
