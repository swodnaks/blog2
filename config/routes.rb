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

  get '/posts/hashtag/:name', to: 'posts#hashtags'

  get 'users/:id/posts' => 'users#posts', :as => :user_posts

  

end
