Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/register', to: 'users#create'
      post 'auth/login', to: 'authentication#login'
      put 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#destroy'
    end

    namespace :v2 do
      get 'scooters', to: 'motorcyles#index'
      get 'scooters/:id', to: 'motorcyles#show'
      post 'scooters/new', to: 'motorcyles#create'
      put 'scooters/:id', to: 'motorcyles#update'
      delete 'scooters/:id', to: 'motorcyles#destroy'

      get 'my_reservations', to: 'my_reservations#index'
      get 'available_scooters', to: 'reservations#index'
      get 'reserve_scooter/:id', to: 'reservations#show'
      post 'reservations/new', to: 'reservations#create'
      put 'reservations/:id', to: 'reservations#update'
      delete 'reservations/:id', to: 'reservations#destroy'

    end

  end
end
