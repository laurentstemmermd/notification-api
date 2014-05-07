module MrdriveNotificationApi

class NotificationService
	require 'singleton'
	include Singleton

	attr_accessor :pubnub, :channel_prefix

	# Return reference corresponding to given product_id
	# Params:
	# +product_id+:: +String+ or +Moped::BSON::ObjectId+
	def notify_user user_id, message

		msg = "Hello PubNub, love the Ruby SDK"
		channel = "demo"

	 	pubnub.publish(:message => msg, :channel => channel) do |envelope|
			puts envelope.message
			puts envelope.channel
			puts envelope.status_code
			puts envelope.timetoken
		end

		puts "#{channel_prefix + user_id}"
	end
end # NotificationService

end # MrdriveNotificationApi
