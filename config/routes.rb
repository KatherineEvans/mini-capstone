Rails.application.routes.draw do
  get "/all_beers" => "products#all_beers_for_sale"
end
