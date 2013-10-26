# Maidservice

Distributed Page Cache Clearing using Redis pub/sub

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

You can also expire folders and files directly by calling

    MaidService.clear "page/path/to/clear"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
