require "http"
require "json"

line_width = 40

puts "Which university data would you like to view?"

uni_name = gets.chomp.gsub(" ","%20")
#uni_name = "University%20of%20Chicago"
pp uni_name


cscore_key = ENV.fetch("CSCORE")

cscore_url = "https://api.data.gov/ed/collegescorecard/v1/schools.json?api_key=#{cscore_key}&school.name=#{uni_name}&per_page=100"

pp cscore_url

raw_response = HTTP.get(cscore_url)

parsed_url = JSON.parse(raw_response)

results = parsed_url.fetch("results")

results.each do |name|
latest = name.fetch("latest")
school = latest.fetch("school")
uni = school.fetch("name")
if uni == uni_name.gsub("%20"," ")
  uni_data = latest
  programs = uni_data.fetch("programs")
  cip = programs.fetch("cip_4_digit")
  pp "What Major?"
  what_major = gets.chomp.upcase + "."
  pp what_major
  cip.each do |title|
    major = title.fetch("title")
    credential = title.fetch("credential")
    level = credential.fetch("title")
    if level == "Bachelor's Degree" &&
      major.upcase == what_major
      earnings = title.fetch("earnings")
      four_yr = earnings.fetch("4_yr")
      med_earnings = four_yr.fetch("overall_median_earnings")
      pp "The overall median earnings for someone with a #{what_major.capitalize.gsub(".","")} degree at #{uni_name.gsub("%20"," ")} is $#{med_earnings}"
    end
  end
end
end
