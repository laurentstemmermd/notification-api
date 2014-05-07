# MrdriveNotificationApi

MrdriveNotificationApi provide a Notification API

## Installation

Add this line to your application's Gemfile:

    gem 'mrdrive_notification_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mrdrive_notification_api

## Usage

### Configuration

#### From file
```ruby
		file_path = File.expand_path("../ressources/config.yml", __FILE__)
		MrdriveNotificationApi.config_file(file_path)
```
#### Using .configure method
```ruby
		MrdriveNotificationApi.configure do |config|
			config.publish_key = '123456'
			config.subscribe_key = '456789'
			config.channel_prefix = 'mrdrive'
		end
```
