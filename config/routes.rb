Rails.application.routes.draw do
  root "pages#home"

  resource  :session
  resources :passwords, param: :token

  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  resources :articles, only: [:index, :show], param: :id

  namespace :admin do
    root to: "articles#index"
    resources :articles do
      member do
        patch :publish
        patch :unpublish
      end
    end
  end

  resources :programs, only: [:index, :show], param: :slug do
    resources :subjects, only: [:index]
  end

  resources :degree_plans, path: "plans"

  get "up" => "rails/health#show", as: :rails_health_check
end
