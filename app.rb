require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'unirest'
require 'json'
require 'uri'

get("/") do
  erb(:homepage)
end

get("/definitions") do
  erb(:definition_form)
end

post("/get_definition") do
  @define_word = params.fetch("user_word")
  word_key = ENV.fetch("DEFINITION_KEY")

  # Construct the URL with proper encoding
  url = "https://wordsapiv1.p.mashape.com/words/#{URI.encode_www_form_component(@define_word)}"

  # Make the API request
  response = Unirest.get url,
                         headers: {
                           "X-Mashape-Key" => word_key,
                           "Accept" => "application/json"
                         }

  # Process the response
  @string_response = response.body.to_s

  erb(:definition_results)
end
