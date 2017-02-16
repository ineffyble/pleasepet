Rails.application.routes.draw do
  resources :noises
  resources :pettings
  root 'index#view'

  resources :pages, path: '', only: [:show, :update], param: :url
  resources :pages, param: :url
  post '/:url/pet' => 'pages#pet'
  devise_for :pets, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
