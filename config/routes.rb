Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :products do
      resources :reviews, only: [:new, :create]
    end
end
