Rails.application.routes.draw do
  
  get 'login', to: "login#index"
  post 'get_login', to: "login#get_login"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #transaction
  get 'transaction/retrieve_stores', to: "transaction#retrieve_stores"
  get 'transaction/retrieve_transactions', to: "transaction#retrieve_transactions"
  post 'transaction/add_transaction', to: 'transaction#add_transaction'

  #user
  post 'user/verify_user', to: 'user#verify_user'
  post 'user/register_user', to: 'user#register_user'

  #dashboard
  post 'dashboard/retrieve_dashboard_data', to: 'dashboard#retrieve_dashboard_data'

end
