Rails.application.routes.draw do
  resources :subjects, only: [:index]
  resource  :curriculum, only: [:show]
  root "curriculum#show"

  get "up" => "rails/health#show", as: :rails_health_check
end
