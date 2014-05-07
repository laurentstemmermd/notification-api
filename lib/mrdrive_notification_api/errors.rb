module MrdriveNotificationApi

class DocumentNotFoundException < Exception

	def self.for collection, query
		raise self, "#{collection.classify} not found for #{query}"
	end

	def self.with_ids collection, ids
		raise self, "#{collection.classify} not found with id(s) #{ids.inspect}"
	end

end

class WrongConfigException < Exception
	def self.missing_config missed
		raise self, "Missing #{missed}."
	end

end

end # MrdriveNotificationApi
