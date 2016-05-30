Rails.application.routes.draw do

  devise_for :users

  # resources :invoices
  resources :charges
  resources :invoices

  root to: 'home#home'

end
