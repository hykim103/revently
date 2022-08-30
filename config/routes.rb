Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/destroy'
  devise_for :users
  root to: "pages#home"
  get 'user_bookings', to: 'bookings#user_bookings'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants
end
