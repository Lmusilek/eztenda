Rails.application.routes.draw do
  devise_for :users
  root to: 'venues#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :drinks_opportunities
  resources :drinks
  resources :venues
  resources :bids

  resources 'profile', to: 'users_profile#index' , as: :profile, only: [:index]
end
