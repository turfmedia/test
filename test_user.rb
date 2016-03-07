require 'minitest/autorun'
require_relative 'user.rb'


describe User do

  it "should #create a user" do
    User.create({email: 'stephane.busso@gmail.com'}).must_be_instance_of(Fixnum)
  end

  it "should list #all users" do
    User.all.must_be_instance_of(Hash)
  end

  it "should #update a user" do
    user_id = User.create({email: 'stephane.busso@gmail.com'})
    User.update(user_id, {email: 'stephane.busso+test@gmail.com'})
    User.find(user_id)[:email] == 'stephane.busso+test@gmail.com'
  end

  it "should #find a user" do
    user_id = User.create({email: 'stephane.busso@gmail.com'})
    User.find(user_id).must_be_instance_of(Hash)
  end

  it "should #delete a user" do
    user_id = User.create({email: 'stephane.busso@gmail.com'})
    User.delete(user_id)
    User.find(user_id).must_be_nil
  end

end
