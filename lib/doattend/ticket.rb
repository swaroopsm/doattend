module Doattend

	class Ticket
		
		attr_accessor :result

		def initialize(result)
			self.result = result
		end
		
		# Returns different ticket names that is available for the event.
		def names
			self.result.map{ |t| t['Ticket_Name'] }.uniq
		end

	end

end
