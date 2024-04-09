require "http"
require "json"

puts "Where are you located?"

user_location = gets.chomp.gsub(" ", "%20")

puts user_location

user_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ user_location + "&key=" + ENV.fetch("GMAPS")
pp user_location
