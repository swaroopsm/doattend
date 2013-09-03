require "rest-client"

module Doattend
	
	class Base
		
		def self.fetch
	  	conf = YAML.load_file("#{Rails.root}/config/doattend.yml")
  		url = "http://doattend.com/api/events/#{conf['doattend']['event']}/participants_list.json?api_key=#{conf['doattend']['key']}"
  		begin
  			RestClient.get(url)
  		rescue Exception => e
  			e
			end
		end

	end

end
