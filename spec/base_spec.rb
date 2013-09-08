require_relative "./spec_helper.rb"
require_relative "../lib/doattend/base.rb"

describe Doattend::Base do
	
	it "should return an object of Doattend::Base with an event id and api key" do
		doattend = Doattend::Base.new(12345, "BlahBlahBlah")
		doattend.should be_instance_of Doattend::Base
	end

end
