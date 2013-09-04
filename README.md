# DoAttend

[![Gem Version](https://badge.fury.io/rb/doattend.png)](http://badge.fury.io/rb/doattend)

Rails generator and functions to communicate the DoAttend API. You need to have a DoAttend API key to communicate the DoAttend API. If you do not have one yet, you can contact DoAttend to get an API key.

## Installation

Add this line to your application's Gemfile:

    gem 'doattend'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doattend

## Usage

Doattend provides a rails generator that gets you started quikly. 
Run the following generator to generate config/doattend.yml
		
		$ rails g doattend:install -e YOUR_DOATTEND_EVENT_ID -k YOUR_DOATTEND_API_KEY

If you are not using Rails you can use require to include it:
		$ require "doattend"

## Create an object of Doattend
		Rails Way:
		@doattend = Doattend::Base.new # This loads the key and event that was generated from config/doattend.yml

		Non-Rails Way:
		@doattend = Doattend::Base.new('YOUR_DOATTEND_EVENT_ID', 'YOUR_DOATTEND_API_KEY')


## Methods
### 1. Fetch all data from DoAttend:
		@doattend.fetch

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
