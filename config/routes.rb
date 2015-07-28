Rails.application.routes.draw do
  resources :users
  resources :people

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/user/:id/settings', to: "users#settings", as: :user_settings
  root 'static_pages#home'
end