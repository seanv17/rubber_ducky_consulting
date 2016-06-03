Rails.application.routes.draw do

  devise_for :users

  # TODO!!! Exclude routes not being used
  # Set routes for charges and invoices controllers
  resources :charges
  resources :invoices

  root to: 'home#home'

end
