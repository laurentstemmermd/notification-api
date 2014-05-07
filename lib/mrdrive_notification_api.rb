require "mrdrive_notification_api/requirements"

module MrdriveNotificationApi

	def self.configure
		setup = EasySetup.new
		yield(setup)
		setup.apply
	end

	def self.config_file file_path
		EasySetup.from_file(file_path).apply
	end

	def self.method_missing method_name, *arguments, &block
		if NotificationService.instance.respond_to?(method_name)
			NotificationService.instance.send(method_name, *arguments, &block)
		else
			super method_name, *arguments, &block
		end
	end

	def self.respond_to?(symbol, include_private=false)
		return true if NotificationService.instance.respond_to?(symbol, include_private)
		super
	end

end
