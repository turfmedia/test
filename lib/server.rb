# server.rb

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

use Rack::Auth::Basic, 'Invalid or expired token' do |username, password|
  username == API_KEY
end

# Client uses incorrect token
error(401) { '{"message":"Invalid or expired token"}' }
error(404) { '{"message":"User doesnt exist"}' }

get '/' do
  {:message => 'Sinatra Webhook Server'}.to_json
end

get '/users' do
  {users: User.all}.to_json
end

post '/users' do
  request.body.rewind
  id = User.create(JSON.parse(request.body.read))
  { message: "new user recorded #{id}", user_id: id}.to_json
end

put '/users/:id' do
  if User.find(params[:id])
    request.body.rewind
    User.update(params[:id], JSON.parse(request.body.read))
  else
    # error user doenst exist
  end
  redirect to('/')
end

delete '/users/:id' do
  if User.find(params[:id])
    User.delete params[:id]
  else
    # error user doenst exist
  end
  redirect to('/')
end
