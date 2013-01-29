Brewlog::Application.routes.draw do
  resources :hops

  devise_for :users

  root to: 'dashboard#index'  
end
