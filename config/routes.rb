Rails.application.routes.draw do
  resources :pet_interactions
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'index#view'
  devise_for :pets, controllers: { registrations: 'registrations' }

  get '/evelyn' => redirect("http://evelyn.pet")

  get '/naptime' => 'index#naptime'

  get '/pettings' => 'pet_interactions#index'
  resources :pages, path: '', only: [:show, :update], param: :url
  resources :pages, only: [:edit], param: :url
  post '/:url/petting'  => 'pet_interactions#do_a_petting'
  get '/:url/pettings' => 'pet_interactions#how_many_pettings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
