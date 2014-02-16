# require 'rango/authentication'
require 'rango/configuration'
# require 'rango/connection'
# require 'rango/request'

module Rango
  # @private
  class API
    # include Connection
    # include Request
    # include Authentication

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Rango.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
