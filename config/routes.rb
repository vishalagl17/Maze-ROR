Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users
  get 'manage', to: 'users#manage'
  resources :posts do
    resources :comments
  end
end
