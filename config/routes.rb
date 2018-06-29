Rails.application.routes.draw do
  get "/beers" => "products#index"
  post "/beers" => "products#create"
  get "/beers/:id" => "products#show"
  patch "/beers/:id" => "products#update"
  delete "/beers/:id" => "products#destroy"
end
