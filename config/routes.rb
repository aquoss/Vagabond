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
  get '/posts/:id', to: 'posts#show', as:'post'

end
