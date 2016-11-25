# Sample app for Picniq OAuth2 Strategy
# Make sure to setup the ENV variables APPLICATION_ID and CLIENT_SECRET
# Run with "bundle exec rackup"

require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-picniq'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/picniq'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env['omniauth.auth'])
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie, :secret => 'change_me'

use OmniAuth::Builder do
  provider :picniq, ENV['APPLICATION_ID'], ENV['CLIENT_SECRET']
end

run App.new
