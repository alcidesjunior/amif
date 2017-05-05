Rails.application.routes.draw do
  resources :galeries
  resources :admins
  get 'profile/:id', to: 'admins#edit'
  resources :modalidades
  resources :professors
  root "home#index"
  resources :atleta
  devise_for :users
  post '/saveFrontPanel/:id', to: 'home#saveFrontPanel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
