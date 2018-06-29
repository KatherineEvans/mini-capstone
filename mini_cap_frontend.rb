require "unirest"

system "clear"

puts "Choose which beer you would like to order:"
puts "[1] IPA"
puts "[2] Double IPA"
puts "[3] Red Ale"
puts "[4] Witbier"

input_choice = gets.chomp

if input_choice == "1"
  response = Unirest.get("http://localhost:3000/beers/#{input_choice}")
  beer = response.body
  puts JSON.pretty_generate(beer)
elsif input_choice == "2"
  response = Unirest.get("http://localhost:3000/beers/#{input_choice}")
  beer2 = response.body
  puts JSON.pretty_generate(beer2)
elsif input_choice == "3"
  response = Unirest.get("http://localhost:3000/beers/#{input_choice}")
  beer3 = response.body
  puts JSON.pretty_generate(beer3)
else 
  puts "Unknown Choice"
end

