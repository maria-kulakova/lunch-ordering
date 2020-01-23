Rails.application.routes.draw do
  root to: 'menus#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users
  resources :orders
  resources :menus do
    resources :orders
  end
end
