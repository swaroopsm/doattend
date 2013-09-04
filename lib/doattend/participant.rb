module Doattend
	
	class Participant
		
		attr_accessor :result, :info

		def initialize(result)
			self.result = result
			self.info = result['participant_information']
		end

	end

end
