require "spec_helper"
require "doattend/base"

describe Doattend::Base do
	
	before(:all) do
		@doattend = Doattend::Base.new
	end
	
	it "#fetch" do
		sample_response = File.new(File.expand_path('../example.json', __FILE__))
		stub_request(:get, @doattend.url).to_return(:body => sample_response)
		@doattend.fetch
	end

	it "#aggregate" do
		@doattend.aggregate.should eq 11
	end

	it "#ticket" do
		@doattend.ticket.should be_instance_of Doattend::Ticket
	end

end
