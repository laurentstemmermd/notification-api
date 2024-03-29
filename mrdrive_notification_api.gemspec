# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mrdrive_notification_api/version'

Gem::Specification.new do |spec|
  spec.name          = "mrdrive_notification_api"
  spec.version       = MrdriveNotificationApi::VERSION
  spec.authors       = ["laurentstemmer"]
  spec.email         = ["laurent.stemmer@monsieurdrive.com"]
  spec.description   = %q{ Service to handle mrdrive notifications. }
  spec.summary       = %q{ Service to handle mrdrive notifications. }
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "pubnub"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
