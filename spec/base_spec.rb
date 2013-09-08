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

	it "#participant" do
		@doattend.participant.should be_instance_of Doattend::Participant
	end

	context "tickets method" do
		
		it "ticket names should be an array" do
			@doattend.ticket.names.should be_instance_of Array
		end

		it "should return the first ticket name" do
			@doattend.ticket.names.first.should eq "Test Registration" 
		end

		it "should return number of registrations for a ticket type" do
			@doattend.ticket.aggregate(@doattend.ticket.names.first).should eq 8 
		end

	end

	context "participant methods" do
		
		it "should pluck all ticket numbers" do
			@doattend.participant.pluck("Ticket_Number").should eq ["326817", "325434", "324549", "324521", "323367", "322474", "322085", "320774", "319951", "319165", "318800"]
		end

	end

end
