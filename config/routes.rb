Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :drinks
  resources :venues do
    resources :drinks_opportunities
  end
  resources :drinks_opportunities do
    resources :bids
  end

  resources 'profile', to: 'users_profile#index' , as: :profile, only: [:index]
end
