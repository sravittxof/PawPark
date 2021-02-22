Rails.application.routes.draw do
  
  #custom routes above generator provided routes
  
  resources :playdates
  resources :visits
  resources :parks, only: [:index, :show, :edit, :update]
  resources :dogs
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
