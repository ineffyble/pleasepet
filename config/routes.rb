Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'index#view'
  devise_for :pets, controllers: { registrations: 'registrations' }

  get '/evelyn' => redirect("http://evelyn.pet")

  get '/naptime' => 'index#naptime'

  resources :pettings, only: [:index]
  resources :pages, path: '', only: [:show, :update], param: :url
  resources :pages, only: [:edit], param: :url
  post '/:url/pet' => 'pages#pet'
  get '/:url/pets' => 'pages#pets'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
