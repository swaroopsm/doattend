module Doattend
	
	class Participant
		
		attr_accessor :result, :info, :general_info

		def initialize(result)
			self.result = result
			#self.info = result['participant_information']
			self.general_info = ['Ticket_Number', 'Email', 'Date', 'Name']
		end

		# Pluck a particular field from participants.
		def pluck(field)
			if self.general_info.include? field
				self.result.map{ |p| p[field] }
			else
				self.result.map{ |p| p['participant_information'].select{ |a| a['desc'] == field } }.flatten.map{ |x| x['info'] }
			end
		end
		
		# Default Participant Finder. Returns a participant having the specified ticket number.
		def find(ticket)
			self.result.select{ |p| p['Ticket_Number'] == ticket }.first
		end

		# Count occurences of key/value.
		# Looks like this method is redundant.
		# TODO: Remove this in the next version
		def ascertain(k, v)
			if self.general_info.include? k
				self.result.count{ |p| p[k] == v.downcase }				
			else
				#self.result.map{ |p| p['participant_information'].select{ |i| i['desc'].strip.downcase == k.split('_').join(' ').downcase and i['info'].strip.downcase == v.downcase  } }.flatten.size
				get_participant_info(k, v).size
			end
		end

		# Return participants who have registered on a particular date.
		def registered
			self
		end

		def on(date)
			self.result.select{ |p| Date.iso8601(p['Date']).strftime == date.strftime }
		end
		
		# Return participant object(s) with a specified key/value.
		def where(k, v)
			if self.general_info.include? k
				self.result.select{ |p| p[k].downcase == v.downcase }
			else
				get_participant_info(k.downcase, v)
			end
		end
		
		private
		def get_participant_info(k, v)
			participants = []
			self.result.each do |p|
				p['participant_information'].each do |pz|
					participants << p if pz['desc'] == k and pz['info'].downcase == v.downcase
				end
			end
			participants
		end

	end

end
