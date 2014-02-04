Brewlog::Application.routes.draw do
  resources :hops
  resources :fermentables
  resources :yeasts

  resources :styles

  devise_for :users, controllers: { registrations: :registrations }

  root to: 'dashboard#index'
end
