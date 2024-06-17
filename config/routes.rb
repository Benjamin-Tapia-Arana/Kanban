Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :boards

  resources :status_lists

  resources :cards
  get 'new_team_card', to: 'cards#new_team_card', as: :new_team_card

  resources :teams

  resources :users

  resources :tu_linkers

  resources :all_boards

  # get 'all_boards', to: 'all_boards#index', as: :all_boards
  # get 'login', to: 'sessions#new'  
  # post 'login', to: 'sessions#create' 
  # get 'signup', to: 'users#new', as: :signup  
  # post 'signup', to: 'users#create' 
  # get "up" => "rails/health#show", as: :rails_health_check 
  # get 'boards', to: 'boards#show', as: :user_
  # get 'boards/index', to: 'boards#index', as: :tables
  # get '/boards/:id', to: 'boards#show', as: :board
  # delete 'logout', to: 'sessions#destroy', as: :logout
  # resources :users, only: [:new, :create]
 
end
