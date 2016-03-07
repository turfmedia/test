
require_relative 'test_helper.rb'
require 'rack/test'
require 'json'
require_relative '../lib/server.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "Sinatra Webhook Server" do


  def setup
    basic_authorize 'qwerty1234567890', nil
  end

  it "should return json" do
    get '/'
    last_response.headers['Content-Type'].must_equal 'application/json'
  end

  it "should retrieve all users" do
    post '/users', {email: 'stephane.busso@gmail.com'}.to_json
    last_response.body.must_include 'new user recorded'
  end

  it "should return a user from its id" do
    post '/users', {email: 'stephane.busso+testget@gmail.com'}.to_json
    id = JSON.parse(last_response.body)['user_id']
    get "/users/#{id}"
    last_response.body.must_include 'stephane.busso+testget@gmail.com'
  end

  it "should create a user and return an id" do
    post '/users', {email: 'user@example.com'}.to_json
    last_response.body.must_include 'new user recorded'
    JSON.parse(last_response.body)['user_id'].must_be_instance_of Fixnum
  end

  it "should update a user and return user" do
    post '/users', {email: 'update@example.com'}.to_json
    id = JSON.parse(last_response.body)['user_id']
    put "/users/#{id}", {email: 'update2@example.com'}.to_json
    last_response.body.must_include "user updated #{id}"
  end

  it "should delete a user" do
    post '/users', {email: 'delete@example.com'}.to_json
    id = JSON.parse(last_response.body)['user_id']
    delete "/users/#{id}"
    last_response.body.must_include "user deleted #{id}"
  end




end
