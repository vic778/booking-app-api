Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/register', to: 'users#create'
      post 'auth/login', to: 'authentication#login'
      put 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#destroy'
    end

    namespace :v2 do
      get 'motorcyles', to: 'motorcyles#index'
      get 'motorcyles/:id', to: 'motorcyles#show'
      post 'motorcyles/new', to: 'motorcyles#create'
      put 'motorcyles/:id', to: 'motorcyles#update'
      delete 'motorcyles/:id', to: 'motorcyles#destroy'
    end

  end
end
