require "doattend/version"
require "doattend/base.rb"

module Doattend

  # Fetch data from DoAttend API.
  def self.fetch
  	Doattend::Base.fetch
  end

end
