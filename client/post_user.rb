require 'rest-client'
require 'base64'
require 'json'

# Set the request parameters
# host = 'https://turfmediatest.herokuapp.com'
host = 'http://localhost:4567'

user = 'qwerty1234567890'
pwd = '12345678'
request_body_map = {
   email: 'admin@exampl.com'   
}

begin  
  # Create a user with just email.
  response = RestClient.post("#{host}/users",
                              request_body_map.to_json,    # Encode the entire body as JSON
                              {:authorization => "Basic #{Base64.strict_encode64("#{user}:#{pwd}")}",
                               :content_type => 'application/json',
                               :accept => 'application/json'})
 
  # print user information
  puts "#{response.to_str}"

  # print status code
  puts "Response status: #{response.code}" 

rescue => e
  # print error code 
  puts "ERROR: #{e}" 
end