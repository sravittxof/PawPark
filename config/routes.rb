Rails.application.routes.draw do
  
  root "welcome#home"
  get '/' => 'welcome#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #custom routes above generator provided routes
  

  resources :visits do 
    resources :playdates
  end
  resources :parks, only: [:index, :show, :edit, :update]
  resources :dogs, only: [:index, :show]
  resources :users do
    resources :dogs, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
