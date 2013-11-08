module Maidservice
  module Listener

    # Daemon that runs and listens
    def self.run
      trap("TERM") { exit }

      $0 = "Maidservice: Starting"

      # get output from the child in there.
      $stdout.sync = true
      $stderr.sync = true

      redis = Maidservice.redis

      begin

        redis.subscribe('expire_page.action_controller') do |on|
          on.subscribe do |channel, subscriptions|
            puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
          end

          on.message do |channel, message|
            puts "##{channel}: #{message}"
            clear_page(message)
          end

          on.unsubscribe do |channel, subscriptions|
            puts "Unsubscribed from ##{channel} (#{subscriptions} subscriptions)"
          end
        end

      rescue ::Redis::BaseConnectionError => error
        puts "#{error}, retrying in 1s"
        sleep 1
        retry
      end

      # never gets here.
    end

    # TODO: scary powerful.  Protect against bad ideas
    def self.clear_page(full_path)
      return unless ActionController::Base.perform_caching
      FileUtils.rm_rf(full_path) if File.exist?(full_path)
      File.delete(full_path + '.gz') if File.exist?(full_path + '.gz')
    end


  end

end