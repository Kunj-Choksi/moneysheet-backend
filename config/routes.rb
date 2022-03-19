Rails.application.routes.draw do
  devise_for :users
  
  get 'login', to: "login#index"
  post 'get_login', to: "login#get_login"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "master/stores#index"

  # master
  namespace :master do
    resources :categories
    resources :stores, only: [:index, :show, :new, :create, :edit, :update]
  end

  # transaction
  get 'transaction/retrieve_stores', to: "transaction#retrieve_stores"
  get 'transaction/retrieve_transactions', to: "transaction#retrieve_transactions"
  post 'transaction/add_transaction', to: 'transaction#add_transaction'

  # client
  post 'client/verify_client', to: 'client#verify_client'
  post 'client/register_client', to: 'client#register_client'

  # dashboard
  post 'dashboard/retrieve_dashboard_data', to: 'dashboard#retrieve_dashboard_data'
end
