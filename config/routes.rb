Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  # USER ROUTES
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  patch '/users/:id', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users', to: 'users#create'

  # SESSIONS ROUTES
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  # CITIES AND POSTS ROUTES
  resources :cities do
    resources :posts
  end

  # USERS AND FOLLOWERS ROUTES
  get '/users/:id/following', to: 'users#following', as: 'following_user'
  get '/users/:id/followers', to: 'users#followers', as: 'followers_user'

  # ROUTES FOR USER RELATIONSHIPS (FOLLOW/UNFOLLOW)
  resources :relationships, only: [:create, :destroy]

end
