json.All_photos @photos.each do |photo|
  json.partial! "photos.json.jbuilder", photo: photo
end