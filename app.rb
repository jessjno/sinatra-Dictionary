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
  webster_key = ENV.fetch("WEBSTER_KEY")
  ref = "sd3"

  url = URI("https://dictionaryapi.com/api/v3/references/#{ref}/json/#{@define_word}?key=#{webster_key}")


  response = Net::HTTP.get(url)

  @definitions = JSON.parse(response)

# Example: Access the first definition
if @definitions.any?
  @first_definition = @definitions[0]['shortdef'][0]
  puts @first_definition
  if @definitions.any?
    @second_definition = @definitions[2]['shortdef'][0]
  end
else
  puts "No definitions found."
end

  erb(:definition_results)
end

get("/translate") do
  erb(:translation_form)
end

get("/translate") do
  erb(:translation_form)
end

post("/get_translation") do
  @translate_word = params.fetch("translate_user_word")
  translate_key = ENV.fetch("TRANSLATE_KEY")
  
  url = URI("https://dictionaryapi.com/api/v3/references/spanish/json/#{@translate_word}?key=#{translate_key}")

  response = Net::HTTP.get(url)

  @response_string = response.to_s

  # Uncomment the line below to parse the response if it's in JSON format
  @translations = JSON.parse(@response_string)

  if @translations.any?
    @translation = @translations[0]['shortdef'][0]
    puts @translation
  else
    puts "No translation found."
  end 
  erb(:translation_results)
end

# post("/get_translation") do
#   @translate_word = params.fetch("translate_user_word")
#   translate_key = ENV.fetch("TRANSLATE_KEY")
#   ref = "spanish"
  
#   url = URI("https://dictionaryapi.com/api/v3/references/spanish/json/#{ref}/json/#{@translate_word}?key=#{translate_key}")


#   response = Net::HTTP.get(url)

#   @response_string = response.to_s

#   #@translation = JSON.parse(response_string)

#   erb(:translation_results)
# end
