Rails.application.routes.draw do
  get 'invoices/index'

  get 'invoices/show'

  get 'invoices/new'

  get 'invoices/create'

  get 'invoices/edit'

  get 'invoices/update'

  get 'invoices/destroy'

  devise_for :users

  # resources :invoices
  resources :charges
  resources :invoices

  root to: 'home#home'

end
