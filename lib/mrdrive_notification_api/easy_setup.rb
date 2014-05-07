module MrdriveNotificationApi

class EasySetup

	attr_accessor :publish_key, :subscribe_key, :channel_prefix

	def self.from_file file_path
		setup = self.new
		YAML.load(File.open(file_path).read).each do |k, v|
			setup.send("#{k}=", v)
		end
		return setup
	end

	def apply

		unless subscribe_key
			WrongConfigException.missing_config(:channel_prefix)
		end
		unless publish_key
			WrongConfigException.missing_config(:publish_key)
		end

		stdout_logger = Logger.new(STDOUT)
		pubnub = Pubnub.new(
			:publish_key   => publish_key,
			:subscribe_key => subscribe_key,
			:error_callback   => lambda { |msg|
			puts "Error callback says: #{msg.inspect}"
			},
			:connect_callback => lambda { |msg|
			puts "CONNECTED: #{msg.inspect}"
			},
			:logger => stdout_logger
		)


		NotificationService.instance.pubnub = pubnub
		NotificationService.instance.channel_prefix = channel_prefix
	end

end

end
