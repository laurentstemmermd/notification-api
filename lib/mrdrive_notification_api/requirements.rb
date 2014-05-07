module MrdriveNotificationApi

	# libs
	require 'json'
	require 'yaml'

	# external gems
	require 'pubnub'
	require 'active_support/all'

	# mrdrive_product_api files
	require "mrdrive_notification_api/version"
	require "mrdrive_notification_api/errors"
	require 'mrdrive_notification_api/config'
	require 'mrdrive_notification_api/easy_setup'
	require 'mrdrive_notification_api/notification_service'

end
