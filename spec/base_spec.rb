require "spec_helper"
require "doattend/base"

describe Doattend::Base do
	
	before(:all) do
		@doattend = Doattend::Base.new
	end
	
	it "should fetch data from the API" do
		canned_response = File.new('/var/www/wazzapp/zaapin-new/api.json')
		stub_request(:get, @doattend.url).to_return(:body => canned_response)
		@doattend.fetch
	end

end
