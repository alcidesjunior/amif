Rails.application.routes.draw do
  root "home#index"
  resources :galeries
  resources :admins
  resources :modalidades
  resources :professors
  resources :atleta
  devise_for :users
  get 'profile/:id', to: 'admins#edit'
  post '/saveFrontPanel/:id', to: 'home#saveFrontPanel'
  get '/blog', to: 'home#blog'
  resources :dailies
  get 'edit/dailies', to: 'dailies#edit'
  # post '/dailies_chamada', to: 'dailies#chamada'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
