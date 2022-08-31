Rails.application.routes.draw do
  get 'reservation/destroy'

  devise_for :users
  root to: "pages#home"
  get 'user_bookings', to: 'reservations#user_bookings'
  get 'confirmation', to: 'reservations#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    resources :reservations, only: [:create]
  end
end
