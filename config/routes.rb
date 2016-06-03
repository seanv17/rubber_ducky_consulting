Rails.application.routes.draw do

  devise_for :users

  # TODO!!! Exclude routes not being used
  # Set routes for charges and invoices controllers
  resources :charges
  resources :invoices

  # Set route and controller action for homepage
  root to: 'home#home'

  #!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ USER ROUTES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!#
  # method  path                        controller#action
  get       "*any",     via: :all,      to: "application#not_found"

  # Doesn't catch bogus routes off of /localhost/invoices/bogusinuthere path
end
