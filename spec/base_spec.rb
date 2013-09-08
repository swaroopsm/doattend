require "spec_helper"
require "doattend/base"

describe Doattend::Base do
	
	before(:all) do
		@doattend = Doattend::Base.new
	end
	
	it "should fetch data from the API" do
		sample_response = File.new(File.expand_path('../example.json', __FILE__))
		stub_request(:get, @doattend.url).to_return(:body => sample_response)
		@doattend.fetch
	end

	it "should return the total participants" do
		@doattend.aggregate.should eq 11
	end

end
