Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "main#index"
  
  get "main", to: "main#index"
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  post "logout", to: "sessions#logout"

  post "game", to: "game#new"
  get "moveToCup", to: "game#moveToCup"
  get "game", to: "game#new"
  post "throwCup", to: "game#throwCup"
end
