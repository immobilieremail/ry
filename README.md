# Capistrano::ry

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano', '~> 3.0'
    gem 'capistrano-ry', github: "capistrano/ry"

And then execute:

    $ bundle install

## Usage

    # Capfile
    require 'capistrano/ry'


    # config/deploy.rb
    set :ry_ruby, 'ruby-2.0.0-p247'

If ry is installed in a custom path (other than ~/.local), you need to
override the following default variable :

    # config/deploy.rb
    set :ry_path, File.join("~", '.local')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
