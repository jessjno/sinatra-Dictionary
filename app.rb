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
  #@define_word = params.fetch("user_word")
  # word_key = ENV.fetch("DEFINITION_KEY")

  # # Construct the URL with proper encoding
  # url = "https://wordsapiv1.p.mashape.com/words/#{URI.encode_www_form_component(@define_word)}"

  # # Make the API request
  # response = Unirest.get url,
  #                        headers: {
  #                          ("X-mashape-Key") => word_key,
  #                          ("Accept") => "application/json"
  #                        }
    # Process the response
  #@string_response = response.body.to_s

  #the below attempt gave me a  AccessDeniedAccess response
  # api_url = "https://dictionaryapi.dev/#{@define_word}"
  # @raw_response = HTTP.get(api_url)
  # #raw_string = @raw_response.to_s
    # # parsed_data = JSON.parse(@raw_string)
  
    
  # Process the response
  #@string_response = response.body.to_s
  
 url = "https://www.carboninterface.com/api/v1/vehicle_make/dodge/vehicle_models"
  #@raw_response = HTTP.get(url)

 # url = ""https://www.carboninterface.com/api/v1/vehicle_makes""

  carbon_key = ENV.fetch("CARBON_KEY")

  response = Unirest.get url,
                         headers: {
                          ("Authorization") => carbon_key,
                          ("Content-Type") => "application/json"

                         }
  @string_response = response.body.to_s

  erb(:definition_results)
end
