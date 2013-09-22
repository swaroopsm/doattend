require "sinatra"
require_relative "base"

module Doattend
	
	class Web < Sinatra::Base
		
		set :public_folder, File.expand_path(File.dirname(__FILE__) + '/web' )
		set :views, File.expand_path(File.dirname(__FILE__) + "/web/views/")

		get "/" do
			@doattend = Doattend::Base.new
			@doattend.fetch

			erb :index
		end
		
	end

end
