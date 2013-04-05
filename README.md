# Omniauth::Untappd :beer:

[![Build Status](https://travis-ci.org/strangnet/omniauth-untappd.png)](https://travis-ci.org/strangnet/omniauth-untappd)

A Omniauth strategy for Untappd

## Installation

Add this line to your application's `Gemfile`:

    gem 'omniauth-untappd', github: 'strangnet/omniauth-untappd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-untappd

## Usage

### Rails

Add this to or create `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :untappd, <INSERT CLIENT_ID HER>, <INSERT CLIENT_SECRET HERE>
end
```

See more details on the omniauth module: https://github.com/intridea/omniauth#readme

## Testing

The project is tested through Travic-CI for Ruby 1.9.2, 1.9.3 and 2.0.0.

[![Build Status](https://travis-ci.org/strangnet/omniauth-untappd.png)](https://travis-ci.org/strangnet/omniauth-untappd)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
