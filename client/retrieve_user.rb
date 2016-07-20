require 'rest-client'
require 'base64'

# Set the request parameters
# host = 'https://turfmediatest.herokuapp.com'
host = 'http://localhost:4567'
user = 'qwerty1234567890'
pwd = '12345678'
user_id = 1

begin
  # Get a user with user_id declared above
  response = RestClient.get("#{host}/users/#{user_id}",
                           {:authorization => "Basic #{Base64.strict_encode64("#{user}:#{pwd}")}",
                            :accept => 'application/json'})
 
  # print user information
  puts "#{response.to_str}"

  # print status code
  puts "Response status: #{response.code}" 

rescue => e
  # print error code 
  puts "ERROR: #{e}" 
end