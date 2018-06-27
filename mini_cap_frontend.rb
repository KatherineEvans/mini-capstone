require "unirest"

system "clear"

puts "Choose which beer you would like to order:"
puts "[1] IPA"
puts "[2] Double IPA"
puts "[3] Red Ale"

input_choice = gets.chomp

if input_choice == "1"
  response = Unirest.get("http://localhost:3000/IPA_beer")
  beer1 = response.body
  puts JSON.pretty_generate(beer1)
elsif input_choice == "2"
  response = Unirest.get("http://localhost:3000/DIPA_beer")
  beer2 = response.body
  puts JSON.pretty_generate(beer2)
elsif input_choice == "3"
  response = Unirest.get("http://localhost:3000/RedAle_beer")
  beer3 = response.body
  puts JSON.pretty_generate(beer3)
else 
  puts "Unknown Choice"
end

