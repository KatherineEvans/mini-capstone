Rails.application.routes.draw do
  get "/beers" => "products#index"
  post "/beers" => "products#create"
  get "/beers/:id" => "products#show"
  patch "/beers/:id" => "products#update"
  delete "/beers/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"
  post "/suppliers" => "products#create"
  get "/suppliers/:id" => "products#show"
  patch "/suppliers/:id" => "products#update"
  delete "/suppliers/:id" => "products#destroy"

  get "/photos" => "photos#index"
  post "/photos" => "photos#create"
  get "/photos/:id" => "photos#show"
  patch "/photos/:id" => "photos#update"
  delete "/photos/:id" => "photos#destroy"
end
