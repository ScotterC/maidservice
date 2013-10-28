require 'rails'

module Maidservice
  class Railtie < ::Rails::Railtie

    initializer "maidservice.subscribe" do
      Maidservice.subscribe
    end

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end

  end
end