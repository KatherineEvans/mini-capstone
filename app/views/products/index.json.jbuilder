json.All_beers @beers.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.image_url product.id
  json.description product.description
end
