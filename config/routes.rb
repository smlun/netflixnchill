Rails.application.routes.draw do
  get 'carts/index'

  get 'carts/show'

  get 'carts/new'

  get 'carts/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :orders
  end

  resources :carts do
    resources :orders
  end

  root 'movies#disclaimer'
end
