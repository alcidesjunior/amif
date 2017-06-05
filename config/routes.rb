Rails.application.routes.draw do
  root "home#blog"
  resources :galeries
  resources :admins
  resources :modalidades
  resources :professors
  resources :atleta
  # devise_for :users
  devise_for :users, skip: [:registrations]
  as :user do
    # root "home#index"
    get "amif" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get '/home', to: 'home#index'
  get 'profile/:id', to: 'admins#edit'
  post '/saveFrontPanel/:id', to: 'home#saveFrontPanel'
  get '/blog', to: 'home#blog'
  #resources :dailies
  get '/dailies', to: 'dailies#index'
  post '/dailies', to: 'dailies#create'
  get '/dailies/new', to: 'dailies#new'
  get 'edit/dailies', to: 'dailies#edit'
  get '/dailies/reports', to: 'dailies#reports'
  post '/dailies/reports', to: 'dailies#reports_list'
  # post '/dailies_chamada', to: 'dailies#chamada'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
