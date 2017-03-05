Rails.application.routes.draw do
  resources :modalidades
  resources :professors
  root "home#index"
  resources :atleta
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
