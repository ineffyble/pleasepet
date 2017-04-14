Rails.application.routes.draw do
  # Sidekiq dashboard
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # Root index
  root 'index#view'
  # Login/logout pages
  devise_for :pets, controllers: { registrations: 'registrations' }
  # Custom redirects and routes
  get '/evelyn' => redirect("http://evelyn.pet")
  get '/naptime' => 'index#naptime'
  get '/pets' => 'index#view'
  # Pettings
  get '/pettings' => 'pet_interactions#index'
  post '/:url/petting'  => 'pet_interactions#do_a_petting'
  get '/:url/pettings' => 'pet_interactions#how_many_pettings'
  # Pet pages
  resources :pages, only: [:edit], param: :url
  # View pet pages at root URL
  resources :pages, path: '', only: [:show, :update], param: :url
end
