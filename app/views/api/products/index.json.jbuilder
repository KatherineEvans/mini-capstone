json.beers @beers.each do |beer|
  json.partial! "product.json.jbuilder", beer: beer
end
