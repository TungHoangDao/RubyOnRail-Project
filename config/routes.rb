Rails.application.routes.draw do
  # get 'cards/new'
  # get 'password_resets/new'
  # get 'password_resets/edit'
  # get 'user_setting/new'
  # get 'uset_setting/new'
  # get 'comments/new'
  # get 'sessions/new'
  # get 'users/new'
  root 'static_pages#home'
  # get  '/help',    to: 'static_pages#help'
  # get  '/about',   to: 'static_pages#about'
  # get  '/contact', to: 'static_pages#contact'
  # get '/register', to: 'users#new'
  # get    '/login',   to: 'sessions#new'
  #
  # get '/news_posts/show', to: 'news_posts#index'
  # get '/news_posts/new', to: 'news_posts#new'
  #
  # # get '/settings', to: 'user_setting#setting'
  # get '/settings/profile', to: 'user_setting#profile'
  # get '/settings/setting', to: 'user_setting#setting'
  #
  # get '/settings/my_posts', to: 'user_setting#my_posts'
  # get '/settings/my_comments', to: 'user_setting#my_comments'
  # get '/settings/comments_to_me', to: 'user_setting#comments_to_me'

  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  #
  # post '/register',to:'users#create'

  # # psot '/'
  #
  # resources :users do
  #   member do
  #     post 'update_password'
  #     post 'update_contact'
  #     post 'update_avatar'
  #   end
  # end
  # resources :news_posts do
  #   member do
  #     get 'show'
  #   end
  # end
  #
  # resources :comments
  # resources :account_activations, only: [:edit]
  # resources :cards
  # resources :password_resets, only: [:new, :create, :edit, :update]
  # resources :comments

  resources :cities
end