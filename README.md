
![build status](https://codeship.com/projects/90ad4cf0-c028-0132-c8c4-12477713df02/status?branch=master)

# OmniAuth Picniq

This gem contains the Picniq OAuth2 Strategy for OmniAuth.

## Installation

Add to your application's `Gemfile`:

```ruby
gem 'omniauth-picniq'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Picniq` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Picniq uses the Doorkeeper gem to use NuAPI as an OAuth2 provider. This is necessary to gain access to the V3 endpoints of this API.  Developers can sign up for a developer account at http://kangaroo.picniq-platform.c66.me.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :picniq, ENV['APPLICATION_ID'], ENV['CLIENT_SECRET']
end
```

You can now access the OmniAuth Picniq OAuth2 URL: `/auth/picniq`.

## Example

1. Clone this repo and `cd` into it
2. `bundle install`
3. `cd example`
4. Set ENV variables for APPLICATION_ID and CLIENT_SECRET
5. Set callback URI to `http://localhost:9292/auth/picniq/callback` in your developer account at http://kangaroo.picniq-platform.c66.me.
6. `bundle exec rackup`
7. Open http://localhost:9292 in your browser and follow links
