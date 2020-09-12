Rails.application.routes.draw do
  root 'projects#index'
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
