Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'create', to:'users#create_user'

  post  'auth',to:'authentication#login'

  get 'available_products',to:'products#available_product'

  get 'particular',to:'products#particular_product'

  get 'usersproduct',to:'products#users_product'

  get 'alphanumeric',to: 'products#search_alphanumeric'
  
  get 'search_by_category',to:'products#search_product_category'

  get 'index',to:'users#index'

  resources :products

  put 'update',to: 'users#update_user'

  post 'buy',to:'purchases#buy_product'

  get 'purchase_list',to:'purchases#index'

  get 'purchasing_of_user',to:'purchases#purchasing_current_user'

  get 'search_by_product',to:'purchases#search_product'

  get 'all_category' ,to: 'categories#index'

end
