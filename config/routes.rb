Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  # USER ROUTES
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'

  # SESSIONS ROUTES
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  # USER POSTS ROUTES
  get '/posts/new', to: 'posts#new', as:'new_post'
  get '/posts/:id', to: 'posts#show', as:'post'
  post '/posts', to: 'posts#create'

  # CITY ROUTES
  get '/city/:id', to: 'cities#show', as:'city'

end
