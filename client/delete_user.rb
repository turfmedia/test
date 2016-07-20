require 'rest-client'
require 'base64'
require 'json'

# Set the request parameters
# host = 'https://turfmediatest.herokuapp.com'
host = 'http://localhost:4567'

user = 'qwerty1234567890'
pwd = '12345678'
user_id = 1


begin  
  # Delete a user with the user_id
  response = RestClient.delete("#{host}/users/#{user_id}",
                              {:authorization => "Basic #{Base64.strict_encode64("#{user}:#{pwd}")}",
                               :accept => 'application/json'})
 
  # print deleted user information and status code
  puts "#{response.to_str}"
  puts "Response status: #{response.code}" 

rescue => e
  # print error code 
  puts "ERROR: #{e}" 
end