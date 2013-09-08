require_relative "./spec_helper.rb"
require_relative "../lib/doattend/base.rb"

describe Doattend::Base do
	
	before(:all) do
		@doattend = Doattend::Base.new("", "") # Pass Event ID and API Key as arguements.
	end
	
	it "does not raise an unauthorized exception" do
		expect{ @doattend.fetch }.to_not raise_error
	end

	it "result attribute should be an instance of hash" do
		 @doattend.result.should be_instance_of Hash
	end

end
