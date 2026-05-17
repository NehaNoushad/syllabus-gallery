Rails.application.routes.draw do
  root "pages#home"

  resource  :session
  resources :passwords, param: :token

  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  resources :programs, only: [:index, :show], param: :slug do
    resources :subjects, only: [:index]
  end

  resources :degree_plans, path: "plans"
  resources :notes, only: [:create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
