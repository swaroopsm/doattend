require "spec_helper"
require "doattend/base"

describe Doattend::Base do
	
	before(:each) do
		@doattend = Doattend::Base.new('EVENT_ID', 'API_KEY')
		sample_response = File.new(File.expand_path('../example.json', __FILE__))
		stub_request(:get, @doattend.url).to_return(:body => sample_response)
		@doattend.fetch		
	end
	
	it "should be an instance of Ticket" do
		@doattend.ticket.should be_instance_of Doattend::Ticket
	end

	it "should be an instance of Participant" do
		@doattend.participant.should be_instance_of Doattend::Participant
	end

	it "should return total number of registrations" do
		@doattend.aggregate.should eq 11
	end

end
