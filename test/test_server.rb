
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

  it "#create should return an id" do
    post '/users', {email: 'stephane.busso@gmail.com'}.to_json
    last_response.body.must_include 'new user recorded'
    JSON.parse(last_response.body)['user_id'].must_be_instance_of Fixnum
  end

  it "#update should return an id" do
    post '/users', {email: 'stephane.busso@gmail.com'}.to_json
    last_response.body.must_include 'new user recorded'
  end

  it "#create should return an id" do
    post '/users', {email: 'stephane.busso@gmail.com'}.to_json
    last_response.body.must_include 'new user recorded'
  end

  it "#create should return an id" do
    post '/users', {email: 'stephane.busso@gmail.com'}.to_json
    last_response.body.must_include 'new user recorded'
  end


end
