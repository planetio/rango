require 'yammer'
require 'rango/api'
require 'rango/client'
require 'rango/configuration'
require 'rango/request'
require 'rango/response'


module Rango
  extend Configuration
  class << self
    # Alias for Rango::Client.new
    #
    # @return [Rango::Client]
    def new(options={})
      Rango::Client.new(options)
    end

    # Delegate to Yammer::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
