Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
end
