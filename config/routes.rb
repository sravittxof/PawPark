Rails.application.routes.draw do
  root "welcome#home"
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #custom routes above generator provided routes
  
  resources :parks do
    resources :visits, only: [:show, :new]
  end
  resources :users
  resources :dogs
  resources :visits  
  resources :playdates

    #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
