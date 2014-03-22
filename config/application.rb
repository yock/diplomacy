require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Diplomacy
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, fixture: true, views: false
      g.integration_tool :rspec, fixture: true, views: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    globals = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))
    globals.merge! globals.fetch(Rails.env, {})
    globals.each do |key, value|
      ENV[key] = value unless value.kind_of? Hash
    end

  end
end
