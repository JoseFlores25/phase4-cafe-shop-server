Rails.application.routes.draw do
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"

  # User routes
  resources :users, only: [:index, :create, :update, :destroy]
  # Coffe routes
  post "/user/coffees", to: "coffees#create"
  post "/user/coffees/remove", to: "coffees#destroy"
  put "/user/coffees", to: "coffees#update"
  get"/user/coffees", to: "coffees#show"
  # post "/login", to: "coffees#create"

  # Topping routes
  post "/topping", to: "toppings#create"
  get "/topping", to: "toppings#show"

  # Feedback routes
  post "/feedback", to: "feedbacks#create"
  get "/feedback", to: "feedbacks#show"

  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
