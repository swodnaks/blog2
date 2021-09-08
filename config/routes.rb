Rails.application.routes.draw do

  devise_for :users
  resources :posts do
  	resources :comments
  end
  resources :posts do
    resources :likes
  end    
  root "posts#index"

  get '/about', to: 'pages#about'
end
