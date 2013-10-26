namespace :maidservice do

  desc "Start Maid Service"
  task :clean do
    MaidService.run
  end

end