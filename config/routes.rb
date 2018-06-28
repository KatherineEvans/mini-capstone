Rails.application.routes.draw do
  get "/all_beers" => "products#all_beers_for_sale"
  get "/IPA_beer" => "products#ipa_beer_for_sale"
  get "/DIPA_beer" => "products#double_ipa_beer_for_sale"
  get "/RedAle_beer" => "products#red_ale_beer_for_sale"
  get "/all_products_url" => "products#all_products_model"
  get "/all_products/:id" => "products#all_products_model"
end
