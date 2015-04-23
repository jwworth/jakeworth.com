Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, param: :url_slug

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
