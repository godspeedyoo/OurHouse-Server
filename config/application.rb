require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'rails/all'
require 'dotenv'
Dotenv.load
require "active_record/railtie"
require_relative '../app/controllers/message_helper'
Bundler.require(*Rails.groups)

module OurHomeApi
  class Application < Rails::Application

    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :options, :head],
          :credentials => true,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end
  end
end
