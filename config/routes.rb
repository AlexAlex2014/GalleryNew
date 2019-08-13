require 'resque/server'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions", passwords: "passwords", omniauth_callbacks: "callbacks" }

  mount Resque::Server.new, at: "/resque"


  root 'static_pages#home'

  get 'categories/index', as: 'user_root'
  # get 'imageloader/index'

  # get 'welcome/index'

  get 'newsfeed' => 'users#newsfeed'
  get 'notifications' => 'users#notifications'
  post 'create_my_category' => 'categories#create_my_category'

  get 'profiles/:id' => 'profiles#show'

  # get 'popular_category' => 'users#popular_category'

  get 'categories/index'
  get 'images/index'
  get 'comments/index'
  get 'likes' => 'likes#create'
  get 'subs' => 'subs#create'

  resources :image_loader

  resources :profiles, :only => [:edit, :update]
  resources :users, :only => [:index, :edit]
  resources :likes, :only => [:new, :create, :destroy]
  resources :subs, :only => [:new, :create, :destroy]

  resources :categories do
    resources :images do
      resources :comments
    end
  end

  resources :images do
    resources :comments
  end
  resources :comments
end

