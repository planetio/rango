require 'rango/configuration'
require 'rango/request'
require 'rango/resource'
require 'rango/account_resource'

module Rango
  # @private
  class API
    
    include Request
    
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
