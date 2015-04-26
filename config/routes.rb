Rails.application.routes.draw do
  root to: 'posts#index'

  get '/sessions/login', to: 'sessions#new', as: 'new_session'
  post '/sessions/login', to: 'sessions#create'
  get '/sessions/logout', to: 'sessions#destroy', as: 'destroy_session'

  get '/:url_slug', to: 'posts#show', as: 'post', param: :url_slug
  get '/:url_slug/edit', to: 'posts#edit', as: 'edit_post', param: :url_slug
  patch '/:url_slug', to: 'posts#update', param: :url_slug
  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/posts/new', to: 'posts#create', as: 'posts'
  post '/post_preview/', to: 'posts#preview'
end
