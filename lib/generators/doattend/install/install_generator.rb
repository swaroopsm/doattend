require 'rails/generators'

module Doattend
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path('../templates', __FILE__)

			class_option :e, :type => :string, :required => true, :desc => "Specify DoAttend Event ID", :banner => "YOUR_DOATTEND_EVENT_ID"
			class_option :k, :type => :string, :required => true, :desc => "Specify DoAttend API key", :banner => "YOUR_DOATTEND_API_KEY"

			def generate_config
				template "doattend.rb", "#{Rails.root}/config/doattend.yml"
			end

		end
end
