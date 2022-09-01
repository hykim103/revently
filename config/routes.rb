Rails.application.routes.draw do
  get 'reservation/destroy'

  devise_for :users
  root to: "pages#home"
  get 'user_bookings', to: 'reservations#user_bookings'
  get 'confirmation', to: 'reservations#create'
  get 'host_restaurants', to: 'restaurants#host_restaurants'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    resources :reservations, only: [:create]
    resources :menus, only: %i[new create edit update]
  end
  resources :reservations, only: [:destroy]
end
