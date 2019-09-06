require 'resque/server'
require "resque_web"

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions", passwords: "devise/passwords", omniauth_callbacks: "callbacks" }

  mount Resque::Server.new, at: "/resque"
  mount ResqueWeb::Engine => "/resque_web"

  root 'static_pages#home'
  get 'categories/index', as: 'user_root'

  get 'newsfeed' => 'users#newsfeed'
  get 'notifications' => 'users#notifications'
  post 'create_my_category' => 'categories#create_my_category'
  post 'create_my_image' => 'images#create_my_image'
  get 'create_my_image' => 'images#create_my_image'
  get 'profiles/:id' => 'profiles#show'
  get 'categories/index'
  get 'images/index'
  get 'comments/index'
  get 'likes' => 'likes#create'
  get 'subs' => 'subs#create'

  resources :image_loaders

  resources :profiles, :only => [:show, :edit, :update]
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
