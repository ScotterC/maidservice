require "maidservice/version"
require 'redis'

module Maidservice

  def self.run
    $0 = "cache-sweeper: Starting"

    # trap signals
    # register_signal_handlers

    # Quote from the resque/worker.
    # Fix buffering so we can `rake resque:scheduler > scheduler.log` and
    # get output from the child in there.
    $stdout.sync = true
    $stderr.sync = true

    redis = ::Redis.new

    begin
      redis.subscribe('pages.expire') do |on|
        on.subscribe do |channel, subscriptions|
          puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
        end

        on.message do |channel, message|
          puts "##{channel}: #{message}"
          redis.unsubscribe if message == "exit"
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

end
