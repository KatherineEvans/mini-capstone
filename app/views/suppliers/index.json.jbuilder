json.All_suppliers @suppliers.each do |supplier|
  json.id supplier.id
  json.name supplier.name
  json.email supplier.email
  json.phone supplier.phone_number
  json.products_info supplier.products_info
end