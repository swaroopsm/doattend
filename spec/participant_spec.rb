require "spec_helper"
require "doattend/base"

describe Doattend::Participant do
	
	before(:each) do
		@doattend = Doattend::Base.new('EVENT_ID', 'API_KEY')
		sample_response = File.new(File.expand_path('../example.json', __FILE__))
		stub_request(:get, @doattend.url).to_return(:body => sample_response)
		@doattend.fetch		
	end

	it "should pluck all ticket numbers" do
		@doattend.participant.pluck("Ticket_Number").should eq ["326817", "325434", "324549", "324521", "323367", "322474", "322085", "320774", "319951", "319165", "318800"]
	end

	it "should return a valid particpant hash of the specified ticket" do
		@doattend.participant.find('326817').should be_kind_of Hash
	end

	it "should return" do
		@doattend.participant.find('316117').should be_nil
	end

end
