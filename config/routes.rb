Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :ads, only: %i[index show] do
    resources :comments
  end
  get 'users/:id/profile', to: 'user#profile', as: :user_profile

  namespace :cabinet do
    resources :users
    resources :ads
  end
end
