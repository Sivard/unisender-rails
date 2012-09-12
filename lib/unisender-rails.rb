require "unisender-rails/version"
require 'unisender-rails/sender'

module UnisenderRails
  module Installer
    extend self

    def install
      ActionMailer::Base.add_delivery_method :unisender, UnisenderRails::Sender
    end
  end
end

UnisenderRails::Installer.install
