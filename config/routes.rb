Brewlog::Application.routes.draw do
  resources :hops
  resources :fermentables

  devise_for :users

  root to: 'dashboard#index'  
end
