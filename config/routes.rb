Rails.application.routes.draw do
   devise_for :users
   root  'home#index'
   namespace :api, defaults: { format: :json } do
    resources :sessions, only: [:create, :destroy]
    resources :projects do
      resources :groups do
        resources :tags
      end
    end
  end
end
