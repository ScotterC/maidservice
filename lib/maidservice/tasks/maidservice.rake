namespace :maidservice do

  desc "Start Maid Service"
  task :clean => :environment do
    Maidservice::Listener.run
  end

end