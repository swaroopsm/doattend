require "rest-client"
require "json"

require_relative "ticket.rb"
require_relative "participant.rb"

module Doattend
	
	class Base
		
		attr_accessor :event, :key, :result, :url

		def initialize(e=nil, k=nil)
			if defined? Rails
	  		conf = YAML.load_file("#{Rails.root}/config/doattend.yml")
	  		self.event = conf['doattend']['event']
	  		self.key = conf['doattend']['key']
	  	else
	  		self.event = e
	  		self.key = k
	  	end
			self.url = "http://doattend.com/api/events/#{self.event}/participants_list.json?api_key=#{self.key}"
		end
		
		# Request DoAttend and fetch results.
		def fetch
  		begin
  			self.result = JSON.parse(RestClient.get(url))
  		rescue Exception => e
  			raise e
			end
		end

		# Get Total Participants.
		def aggregate
			self.result['participants'].size
		end

		# Use methods of Ticket class.
		def ticket
			Doattend::Ticket.new(self.result['participants'])
		end

		# Use methods of Participant class.
		def participant
			Doattend::Participant.new(self.result['participants'])
		end

	end

end
