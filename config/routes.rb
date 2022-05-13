Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/register', to: 'users#create'
      post 'auth/login', to: 'authentication#login'
      put 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#destroy'
    end
  end
end
