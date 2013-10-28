# Maidservice

Distributed Page Cache Clearing using Redis pub/sub

Note:  This gem has the power to remove files from your server.  Be very careful about how you use it so you don't end up force removing your root.  I'm working on adding some protections against this.

## Installation

Add this line to your application's Gemfile:

    gem 'maidservice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maidservice

## Usage

Maidservice will need to be run as a daemon to listen for page expiring events.

    $ rake maidservice:clean

It hooks into the existing `expire_page` logic and make sure that all servers running maidservice will also expire those pages.

You can also expire folders and files directly by calling.  Be very careful to pass in a full path here.  Because it will remove whatever file you give it.

    MaidService.clear "page/path/to/clear"

If you want to configure your redis instance for maidservice

    # initializers/maidservice.rb
    Maidservice.configure do |config|
      config.redis = Redis.new # can also be a redis url
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
