require "http"
require "json"

line_width = 40

puts "Which university data would you like to view?"

uni_name = gets.chomp

pp uni_name

cscore_key = ENV.fetch("CSCORE")

cscore_url = https://api.data.gov/ed/collegescorecard/v1/schools.json?

pp cscore_url
