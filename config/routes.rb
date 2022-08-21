Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: :json }
      resources :posts, defaults: { format: :json }
      resources :comments, defaults: { format: :json }
      resources :profiles, only: [:show]
    end
  end
end
