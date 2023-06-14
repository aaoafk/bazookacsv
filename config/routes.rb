Rails.application.routes.draw do
  root 'landing_pages#index'

  resources :subscriptions, only: [:create]
end
