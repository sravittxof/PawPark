Rails.application.routes.draw do
  
  root "welcome#home"
  get '/' => 'welcome#home'
  get '/auth/:provider/callback', to: 'sessions#omniauth' #, via: [:get, :post]
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #custom routes above generator provided routes
  
  

  #resources :parks, only: [:index, :show, :edit, :update]
  resources :parks do
    resources :visits, only: [:show, :new]#[:new, :create, :edit, :update]
  end
  resources :users do
    resources :dogs, only: [:index, :new, :create]
  end
  resources :dogs, only: [:index, :show]

   resources :visits do 
     resources :playdates
   end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
