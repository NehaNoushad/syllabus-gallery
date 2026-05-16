Rails.application.routes.draw do
  resources :subjects, only: [:index]
  root "subjects#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
