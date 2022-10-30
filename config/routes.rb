Rails.application.routes.draw do
  devise_for :users

  root "posts#index"
  resources :users

  get 'manage', to: 'users#manage'
  get 'createuser', to: 'users#createuser'
  get 'reports', to: 'users#reports'
  get 'postfour', to: 'users#postfour'
  get 'postwise', to: 'users#postwise'
  get 'resultxl', to: 'users#resultxl'
  get 'posttwoxl', to: 'users#posttwoxl'
  get 'reportbodyxl', to: 'users#reportbodyxl'

  resources :users, only: [:manage] do
    member do
      patch :ban
    end
  end

  resources :posts do
    resources :comments
  end
end
