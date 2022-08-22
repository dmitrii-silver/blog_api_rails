Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: :json }
      resources :posts, defaults: { format: :json }
      resources :comments, defaults: { format: :json }

      get 'profiles/:id', to: 'profiles#show'
    end
  end
end
