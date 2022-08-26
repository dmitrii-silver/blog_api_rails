require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: :json }
      resources :posts, defaults: { format: :json }
      resources :comments, defaults: { format: :json }

      get 'profiles/:id', to: 'profiles#show'
      get 'profiles/', to: 'profiles#new'
      post 'reports/by_author', to: 'reports#by_author', defaults: { format: :json }
    end
  end
end
