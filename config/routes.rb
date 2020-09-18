Rails.application.routes.draw do
  get 'api/v1/users/coaches', to: 'api/v1/users#coach_index'
  get 'api/v1/users/retrieve_coach_posts', to: 'api/v1/users#retrieve_coach_posts'
  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  resources :types, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :update, :destroy]
  resources :posts
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
