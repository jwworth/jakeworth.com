# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'posts#index'

  resources :projects, except: :destroy
  resources :speaking_engagements, only: %i[new create update edit]

  get '/about', to: 'about#show', as: 'about'

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
  get '/admin', to: 'sessions#new'
  post '/admin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: 'destroy_session'

  get '/favorites', to: 'posts#favorites', as: 'favorite_posts'
  get '/:url_slug', to: 'posts#show', as: 'post', param: :url_slug
  get '/:url_slug/edit', to: 'posts#edit', as: 'edit_post', param: :url_slug
  patch '/:url_slug', to: 'posts#update', param: :url_slug

  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/posts/new', to: 'posts#create', as: 'posts'

  post '/body_preview/', to: 'posts#body_preview'
  post '/slug_preview/', to: 'posts#slug_preview'
end
