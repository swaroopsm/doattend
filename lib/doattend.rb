require "doattend/version"
require "rest-client"
require "yaml"

module Doattend

  # Fetch data from DoAttend API.
  def self.fetch
  	config = YAML.load("#{Rails.root}/config.doattend.yml")
  	url = "http://doattend.com/api/events/#{conf[:event]}/participants_list.json?api_key=#{conf[:key]}"
  	begin
  		RestClient.get(url)
  	rescue Exception => e
  		e
  	end
  	RestClient.get(url)
  end

end
