Brewlog::Application.routes.draw do
  resources :hops
  resources :fermentables
  resources :yeasts

  devise_for :users

  root to: 'dashboard#index'  
end
