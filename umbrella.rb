require "http"
require "json"

puts "Where are you located?"

user_location = gets.chomp.gsub(" ", "%20")

puts user_location

user_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ user_location + "&key=" + ENV.fetch("GMAPS")

resp = HTTP.get(user_url)

raw_response = resp.to_s

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)

geo = first_result.fetch("geometry")

location = geo.fetch("location")

latitude = location.fetch("lat")
longitude = location.fetch("lng")

weather_url = "https://api.pirateweather.net/forecast/" + ENV.fetch("PIRATE")+ "/" + latitude.to_s + "," + longitude.to_s 

pp weather_url









  
