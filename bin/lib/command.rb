module Command

	require 'optparse'

	def self.version args = nil
		puts MrdriveNotificationApi::VERSION
	end

	def self.help args = nil
		puts File.open(ressources_path('help.txt')).read
	end

	def self.notify_user args
		options = {}
		OptionParser.new do |opts|
			opts.banner = "Usage: product-api get [options]"

			opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
				options[:verbose] = v
			end

			opts.on("-u", "--user_id user_id", "user id") do |u|
				options[:user_id] = u
			end

			opts.on("-m", "--message message", "message") do |m|
				options[:message] = m
			end

			opts.on("-f", "--config_file path", "Path to config file") do |f|
				options[:config_file] = f
			end


		end.parse!

		default_setup(options[:config_file])

		if options[:verbose]
			puts "Performing get with options : #{JSON.pretty_generate(options)}"
		end

		MrdriveNotificationApi.notify_user(options[:user_id], options[:message])
		puts "Notified"
	end

	private
	def self.default_setup config_file_path = nil
		if config_file_path
			MrdriveNotificationApi.config_file(config_file_path)
		else
			MrdriveNotificationApi.configure do |config|
				config.publish_key = '123456'
				config.subscribe_key = '456789'
				config.channel_prefix = 'mrdrive'
			end
		end
	end

	def self.object_to_hash object
		if object.is_a?(Array)
			returned = object.map { |e| object_to_hash(e) }
		else
			returned = {}
			object.instance_variables.each {|var| returned[var.to_s.delete("@")] = object.instance_variable_get(var) }
		end
		return returned
	end

	def self.ressources_path file_name
		File.expand_path("../ressources/#{file_name}", __FILE__)
	end

end
