Rails.application.routes.draw do
  devise_for :b_users
  resources :images
  get 'welcome/index'
  get 'pages/home'
  get 'pages/restaurants'
  resources :restaurants do
  	resources :reservations
  end
  root 'welcome#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
