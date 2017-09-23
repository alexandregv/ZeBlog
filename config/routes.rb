Rails.application.routes.draw do

  root to: 'pages#accueil'
 
  resources :posts
  resources :categories
  resources :users, only: [:new, :create, :edit] do
    member do
      get 'confirm'
    end
  end
  
  get '/accueil', to: 'pages#accueil', as: 'accueil'

end