require 'maidservice'
require 'maidservice/listener'

namespace :maidservice do
  desc "Start Maid Service"
  task :clean => :preload do
    Maidservice::Listener.run
  end

  desc "Setup Rails environment"
  task :preload do
    if defined?(Rails) && Rails.application
      Rails.application.require_environment!
    end
  end

end