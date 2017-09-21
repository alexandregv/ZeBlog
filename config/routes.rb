Rails.application.routes.draw do

  resources :posts
  resources :categories
  
  root to: 'pages#accueil'
    
  get '/accueil', to: 'pages#accueil', as: 'accueil'
    
end