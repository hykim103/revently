Rails.application.routes.draw do
  get 'reservation/destroy'

  devise_for :users

  root to: "pages#home"
  get 'user_bookings', to: 'reservations#user_bookings'
  get 'host_bookings', to: 'reservations#host_bookings'
  get 'confirmation', to: 'reservations#create'
  get 'host_restaurants', to: 'restaurants#host_restaurants'
  get 'host_restaurants/:id', to: 'restaurants#host_show', as: 'host_restaurant'
  delete 'destroy_restaurant_menu', to: 'menus#destroy'

  resources :restaurants do
    resources :reservations, only: [:create]
    resources :menus, only: %i[new create edit update]
  end
  resources :reservations, only: [:destroy]
end
