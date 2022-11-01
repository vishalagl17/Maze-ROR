Rails.application.routes.draw do
  devise_for :users

  root "posts#index"
  resources :users

  get 'manage', to: 'users#manage'
  get 'createuser', to: 'users#createuser'

  resources :users, only: [:manage] do
    member do
      patch :ban
    end
  end

  resources :posts do
    resources :comments
  end
end
