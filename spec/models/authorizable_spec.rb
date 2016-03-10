require 'rails_helper'

describe Authorizable do

	let(:my_token){"/this is my token/"}

	it "should store the authentication token prepended by bearer" do
		#setup
		#passed_token = "/this is my token/"
		expected_token = "this is my token"
		#exercise
		Authorizable.set_token my_token
		#verify
		#expect(Authorizable.get_token).to start_with "bearer"
		#expect(Authorizable.get_token).to include passed_token
		expect(Authorizable.get_token).to eq "bearer " + expected_token
		#teardown
	end

	it "should sign in when I have a token stored" do
		#my_token = "banana"
		Authorizable.set_token my_token
		expect(Authorizable).to be_signed_in
	end

	it "should sign out when I dont have a token stored" do 
		#setup
		Authorizable.set_token my_token
		#exercise
		Authorizable.clear_token
		#verify
		expect(Authorizable).to_not be_signed_in
		expect(Authorizable.get_token).to be_nil
	end

end
