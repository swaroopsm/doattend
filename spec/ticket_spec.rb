require "spec_helper"
require "doattend/base"

describe Doattend::Ticket do
	
	before(:each) do
		@doattend = Doattend::Base.new
		sample_response = File.new(File.expand_path('../example.json', __FILE__))
		stub_request(:get, @doattend.url).to_return(:body => sample_response)
		@doattend.fetch		
	end

	it "ticket names should be an array" do
		@doattend.ticket.names.should be_kind_of Array
	end
		
	it "should return the first ticket name" do
		@doattend.ticket.names.first.should eq "Test Registration" 
	end

	it "should return number of registrations for a ticket type" do
		@doattend.ticket.aggregate(@doattend.ticket.names.first).should eq 8 
	end

end
