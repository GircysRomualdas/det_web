Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :detail_preps

  resources :find_detail_preps
  resources :locales
  resources :order_preps
  resources :orders

  resources :home
  
  # root "orders#index"
  root "home#index"
end
