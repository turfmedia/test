##
# API Server
#
# Simple API for exercise purpose. CRUD interface and basic authentication.

require 'sinatra'
require 'json'
require_relative 'models/user'

configure do
  # authorization
  API_KEY = 'qwerty1234567890'
  User.init
end

mime_type :json, 'application/json'

before do
  content_type :json
end


# Basic authentication
use Rack::Auth::Basic, 'Invalid or expired token' do |username, password|
  username == API_KEY
end

# Client uses incorrect token
error(401) { '{"message":"Invalid or expired token"}' }

# User not found
error(404) { '{"message":"User doesnt exist"}' }

# Default root message, used to validate json format
get '/' do
  {:message => 'Sinatra Webhook Server'}.to_json
end

# Retrieve all users
get '/users' do
  {users: User.all}.to_json
end

# Retrieve 1 user
get '/users/:id' do
  if user = User.find(params[:id].to_i)
    request.body.rewind
    user.to_json
  else
    halt 404
  end
end

# Create a user
post '/users' do
  request.body.rewind
  id = User.create(JSON.parse(request.body.read))
  { message: "new user recorded #{id}", user_id: id}.to_json
end

# Update a user
put '/users/:id' do
  id = params[:id].to_i
  if User.find(id)
    request.body.rewind
    User.update(id, JSON.parse(request.body.read))
    { message: "user updated #{id}", user_id: id}.to_json
  else
    halt 404
  end
end

# Delete a user
delete '/users/:id' do
  id = params[:id].to_i
  if User.find(id)
    User.delete id
    { message: "user deleted #{id}", user_id: id}.to_json
  else
    halt 404
  end
end
