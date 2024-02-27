Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :orders
  resources :order_preps
  resources :find_detail_preps
  resources :locales

  root "orders#index"
end
