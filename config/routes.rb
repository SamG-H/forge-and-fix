Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]
  get '/issues/:id/tasks/new', to: 'tasks#new', as: :new_task
  post '/issues/:id/tasks', to: 'tasks#create', as: :create_task
  patch '/issues/:id/tasks', to: 'tasks#update', as: :update_task
  resources :tasks, only: [:index, :show, :edit, :update, :destroy]
  root 'static#welcome'
  resources :projects do
    resources :issues
  end
  resources :users, only: [:create, :show]
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
