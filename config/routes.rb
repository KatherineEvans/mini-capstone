Rails.application.routes.draw do
  get "/beers" => "products#index"
  get "/beers/:id" => "products#show"
end
