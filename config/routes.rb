Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  # patch "/products/:id" => "products#update"
  # delete "/products/:id" => "products#destroy"
  # get "/suppliers" => "suppliers#index"
  # get "/suppliers/:id" => "suppliers#show"
  # post "/suppliers" => "suppliers#create"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/orders" => "orders#index"
  post "/orders" => "orders#create"
  get "/orders:id" => "orders#show"
end
