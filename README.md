# DoAttend

Rails generator and functions to communicate the DoAttend API. You need to have a DoAttend API key to communicate the DoAttend API. If you do not have one yet, you can contact DoAttend to get an API key.

## Installation

Add this line to your application's Gemfile:

    gem 'doattend'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doattend

## Usage

As of now doattend is build as a dependency to Rails. 
Run the following generator to generate config/doattend.yml
		
		$ rails g doattend:install -e YOUR_DOATTEND_EVENT_ID -k YOUR_DOATTEND_API_KEY

## Methods
### 1. Fetch all data from DoAttend:
		$ Doattend.fetch

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
