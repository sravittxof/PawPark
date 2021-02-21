Rails.application.routes.draw do
  resources :visits
  resources :parks
  resources :dogs
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
