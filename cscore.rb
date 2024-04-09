require "http"
require "json"

line_width = 40

puts "Which university data would you like to view?"

#uni_name = gets.chomp.gsub(" ","%20")
uni_name = "University%20of%20Chicago"
pp uni_name


cscore_key = ENV.fetch("CSCORE")

cscore_url = "https://api.data.gov/ed/collegescorecard/v1/schools.json?api_key=#{cscore_key}school.name=#{uni_name}"

pp cscore_url

raw_response = HTTP.get(cscore_url)

parsed_url = JSON.parse(raw_response)
