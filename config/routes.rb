Rails.application.routes.draw do
  resource  :session
  resources :passwords, param: :token

  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  resources :subjects, only: [:index]
  resource  :curriculum, only: [:show]
  root "curriculum#show"

  get "up" => "rails/health#show", as: :rails_health_check
end
