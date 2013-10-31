require 'maidservice/configuration'
require 'maidservice/railtie'
require 'redis'

module Maidservice
  class << self
    def redis
      Maidservice.configuration.redis
    end

    # Publishing to redis
    # Playing with fire here
    def clear(full_path)
      redis.publish('expire_page.action_controller', full_path)
    end

    # Delegate the active support notifications
    def subscribe
      ActiveSupport::Notifications.subscribe('expire_page.action_controller') do |*args|
        event = ActiveSupport::Notifications::Event.new *args
        Maidservice.clear(event.payload[:path])
      end
    end
  end

end
