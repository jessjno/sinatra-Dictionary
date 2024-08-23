require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'unirest'
require 'json'
require 'uri'
require 'net/http'
require 'http'

get("/") do
  erb(:homepage)
end

get("/definitions") do
  erb(:definition_form)
end

post("/get_definition") do
  @define_word = params.fetch("user_word")
  # word_key = ENV.fetch("DEFINITION_KEY")
  webster_key = ENV.fetch("WEBSTER_KEY")
  ref = "sd3"

  url = URI("https://dictionaryapi.com/api/v3/references/#{ref}/json/#{@define_word}?key=#{webster_key}")


  response = Net::HTTP.get(url)

  definitions = JSON.parse(response)

# Example: Access the first definition
if definitions.any?
  first_definition = definitions[0]['shortdef'][0]
  puts first_definition
else
  puts "No definitions found."
end

  erb(:definition_results)
end
