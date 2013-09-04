require "rest-client"
require "json"

require_relative "ticket.rb"

module Doattend
	
	class Base
		
		attr_accessor :event, :key, :result

		def initialize(e=nil, k=nil)
			if defined? Rails
	  		conf = YAML.load_file("#{Rails.root}/config/doattend.yml")
	  		self.event = conf['doattend']['event']
	  		self.key = conf['doattend']['key']
	  	else
	  		self.event = e
	  		self.key = k
	  	end

		end
		
		# Request DoAttend and fetch results.
		def fetch
  		url = "http://doattend.com/api/events/#{self.event}/participants_list.json?api_key=#{self.key}"
  		begin
  			self.result = JSON.parse(RestClient.get(url))
  		rescue Exception => e
  			e
			end
		end

		# Get Total Participants.
		def aggregate
			self.result['participants'].size
		end

		# Use methods of Ticket class.
		def ticket
			Ticket.new(self.result['participants'])
		end

	end

end
