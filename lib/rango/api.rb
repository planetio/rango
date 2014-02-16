require 'rango/configuration'

module Rango
  # @private
  class API

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    attr_accessor :client

    # Creates a new API
    def initialize(options={})
      options = Rango.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    def get(resource, params={}, opts={})
      client[resource].get(params.to_json, request_options.merge(opts))
    end
    
    def post(resource, params={}, opts={})
      client[resource].post(params.to_json, request_options.merge(opts))
    end
    
    private

    def request_options
      {content_type: :json}
    end
    
    def client
      client ||= RestClient::Resource.new(base_endpoint, user: platform_id, password: platform_key)
    end

    def base_endpoint
      endpoint + "/" + api_path_prefix
    end
  end
end
