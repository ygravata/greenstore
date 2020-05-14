Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :reviews, only: [:new, :create]
    resources :cart_products, only: [:create, :destroy]
  end
  resources :carts, only: [:index, :update]
end
