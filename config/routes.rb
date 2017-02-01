Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  # USER ROUTES
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'

<<<<<<< HEAD
  # SESSIONS ROUTES
=======
  get '/posts/:id', to: 'posts#show', as: 'post'

>>>>>>> d86b61c58545f65771af599766e4ee549318c171
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  # USER POSTS ROUTES
  get '/posts/:id', to: 'posts#show', as:'post'

end
