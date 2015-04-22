Rails.application.routes.draw do
  root to: 'posts#index'

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
end
