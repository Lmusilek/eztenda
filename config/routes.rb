Rails.application.routes.draw do
  get 'venues/index'
  get 'venues/show'
  get 'venues/new'
  get 'venues/create'
  get 'venues/edit'
  get 'venues/update'
  get 'venues/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :drinks_opportunities
  resources :drinks
  resources :venues

end
