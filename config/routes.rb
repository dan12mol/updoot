Rails.application.routes.draw do
  root 'application#index'

  resources :subscriptions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :token, controller: 'application'
end
