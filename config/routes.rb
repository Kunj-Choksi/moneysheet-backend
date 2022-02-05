Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'transaction/retrieve_stores', to: "transaction#retrieve_stores"
  get 'transaction/retrieve_transactions', to: "transaction#retrieve_transactions"
  post 'transaction/add_transaction', to: 'transaction#add_transaction'
end
