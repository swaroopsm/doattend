module Doattend
	
	class Participant
		
		attr_accessor :result, :info, :general_info

		def initialize(result)
			self.result = result
			#self.info = result['participant_information']
			self.general_info = ['Ticket_Number', 'Email', 'Date', 'Name']
		end

		# Pluck a particular field from participants
		def pluck(field)
			if self.general_info.include? field
				self.result.map{ |p| p[field] }
			else
				self.result.map{ |p| p['participant_information'].select{ |a| a['desc'] == field } }.flatten.map{ |x| x['info'] }
			end
		end

	end

end
