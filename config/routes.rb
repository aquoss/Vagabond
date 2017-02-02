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

  # USER POSTS ROUTES
  get '/city/:id/posts/new', to: 'posts#new', as:'new_post'
  get '/city/:id/posts/:id', to: 'posts#show', as:'post'
  post '/city/:id/posts', to: 'posts#create'
  get '/city/:id/posts/:id/edit', to: 'post#edit', as: 'edit_post'
  patch '/city/:id/posts/:id', to: 'post#update'

  # CITY ROUTES
  get '/city/:id', to: 'cities#show', as:'city'

end
