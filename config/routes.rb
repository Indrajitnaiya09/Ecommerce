Rails.application.routes.draw do
  resources :addresses
  resources :coupons
  resources :brands
  devise_for :users
  resources :orders
  get 'products/index'
  resources:categories
  resources:products
  resources:reviews
  resources:cart_line_items
  resources:wish_lists

  get 'say/hello'
  get 'say/goodbye'
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
