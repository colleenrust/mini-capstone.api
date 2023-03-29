Rails.application.routes.draw do
  get "/one_product/:id" => "produts#singular"
  get "/products" => "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
