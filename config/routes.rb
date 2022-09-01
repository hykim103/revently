Rails.application.routes.draw do
  get 'reservation/destroy'

  devise_for :users

  root to: "pages#home"
  get 'user_bookings', to: 'reservations#user_bookings'
  get 'confirmation', to: 'reservations#create'
  get 'host_restaurants', to: 'restaurants#host_restaurants'
  get 'destroy_restaurant_menu', to: 'menus#destroy'

  resources :restaurants do
    resources :reservations, only: [:create]
    resources :menus, only: %i[new create edit update]
  end
  resources :reservations, only: [:destroy]
end
