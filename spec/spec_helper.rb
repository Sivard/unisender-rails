require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'unisender-rails'
require "data_macros"

RSpec.configure do |config|

  config.include(DataMacros)

end
