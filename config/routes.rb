Rails.application.routes.draw do
  resources :orders
  resources :accounts
  resources :tags
  resources :products
  resources :departments
end
