Rails.application.routes.draw do
  resources :email_plans
  get 'home/index'

  devise_for :users
  root to: 'home#index'
end