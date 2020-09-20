Rails.application.routes.draw do
  root 'static#welcome'
  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]
  resources :users, only: [:create, :show]
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :projects do
    resources :issues
  end


  resources :tasks, except: [:new, :create, :update]
  get '/issues/:id/tasks/new', to: 'tasks#new', as: :new_task
  post '/issues/:id/tasks', to: 'tasks#create', as: :create_task
  patch '/issues/:id/tasks', to: 'tasks#update', as: :update_task
end
