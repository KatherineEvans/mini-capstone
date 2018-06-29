Rails.application.routes.draw do
  get "/beers" => "products#index"
  post "/beers" => "products#create"
  get "/beers/:id" => "products#show"

end
