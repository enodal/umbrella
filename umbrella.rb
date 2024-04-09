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

weather = HTTP.get(weather_url)

raw_w_response = weather.to_s

parse_w_response = JSON.parse(raw_w_response)

current = parse_w_response.fetch("currently")

temp = current.fetch("temperature")

pp "The current temperature in Chicago is " + temp.to_s + " degrees farenheit."

hourly = parse_w_response.fetch("hourly")

data = hourly.fetch("data")

nxt_hr_data = data.at(1)

nxt_hr_temp = nxt_hr_data.fetch("temperature")

pp "The temperature for the next hour is " + nxt_hr_temp.to_s + " degrees farenheit"






  
