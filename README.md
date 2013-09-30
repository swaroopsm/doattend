# DoAttend

[![Gem Version](https://badge.fury.io/rb/doattend.png)](http://badge.fury.io/rb/doattend)
[![Code Climate](https://codeclimate.com/github/swaroopsm/doattend.png)](https://codeclimate.com/github/swaroopsm/doattend)
[![Dependency Status](https://gemnasium.com/swaroopsm/doattend.png)](https://gemnasium.com/swaroopsm/doattend)
[![Build Status](https://travis-ci.org/swaroopsm/doattend.png?branch=master)](https://travis-ci.org/swaroopsm/doattend)
[![Coverage Status](https://coveralls.io/repos/swaroopsm/doattend/badge.png?branch=master)](https://coveralls.io/r/swaroopsm/doattend?branch=master)

Rails generator and functions to communicate the DoAttend API. You need to have a DoAttend API key to communicate the DoAttend API. If you do not have one yet, you can contact DoAttend to get an API key.

## Installation

Add this line to your application's Gemfile:

    gem 'doattend'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doattend

## Usage

Doattend provides a rails generator that gets you started quickly. 
Run the following generator to generate config/doattend.yml
		
		$ rails g doattend:install -e YOUR_DOATTEND_EVENT_ID -k YOUR_DOATTEND_API_KEY

#####If you are not using Rails you can use require to include it:
		$ require "doattend"

## Getting Started
		Rails Way:
		doattend = Doattend::Base.new # This loads the key and event that was generated from config/doattend.yml

		Non-Rails Way:
		doattend = Doattend::Base.new('YOUR_DOATTEND_EVENT_ID', 'YOUR_DOATTEND_API_KEY')
		
		Fetch all data:
		doattend.fetch
		


## Methods

### 1. Ticket
#### Get total number of tickets
		doattend.aggregate

#### Get ticket names/types used in an event
		doattend.ticket.names

#### Get total number of registrations for a ticket name/type
		doattend.ticket.aggregate('ticket_type')

		Eg.:
		doattend.ticket.aggregate(doattend.ticket.names.first)

### 2. Participants

#### Find a participant by ticket number
		 doattend.participant.find('TICKET_NUMBER')

#### Ascertain a count whether a key == value
		 doattend.participant.ascertain('KEY', 'VALUE')

		 Eg.:
		 doattend.participant.ascertain('Gender', 'Male')

#### Return participant objects registered on a specfied date
		 doattend.participant.registered.on(DATE_OBJECT)

		 Eg.:
		 doattend.participant.registered.on(Date.new(2013,5,8))

#### Return array of participant objects based on a single condition
		 doattend.participant.where('KEY', 'VALUE')

		 Eg.: 
		 doattend.participant.where('Nationality', 'Indian')

#### Pluck a field from all participants
		doattend.participant.pluck('FIELD_NAME')

		Eg.:
		doattend.participant.pluck('Email')

## Mounting to Rails
This gem also provides a web interface that lists all participants, which can be easily mounted to your Rails App(if you are using rails).

1. Add 'sinatra' to your Gemfile
	 	`gem 'sinatra', :require => nil`

2. Specify the route in your config/routes.rb

		require 'doattend'
		mount Doattend::Web, :at => "/doattend"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/swaroopsm/doattend/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

