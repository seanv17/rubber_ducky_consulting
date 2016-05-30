Rails.application.routes.draw do

  devise_for :users

  # resources :invoices
  resources :charges
  resources :invoices

  root to: 'home#home'

  delete      '/invoices/:id',       to: 'invoices#destroy',  as: :destroy_invoice

end
