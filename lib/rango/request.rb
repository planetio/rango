require 'unirest'

module Rango
  module Request

    def client
      Unirest
    end

    def get(*args)
      client.get(*format_args(args))
    end
    
    def post(*args)
      client.post(*format_args(args))
    end

    private
    
    def format_args(args)
      resource = format_resource(args.shift)
      params = format_params(*args)
      [resource, params]
    end
    
    def format_resource(resource)
      base_endpoint + resource
    end
    
    def format_params(request_params={}, opts={})
      params = default_options
      params[:parameters] = request_params.to_json if request_params.present?
      params.merge(opts)
    end

    def default_options
      {
        headers: {'Accept' => '*/*', 'Content-Type' => 'application/json'},
        auth:    {user: platform_id, password: platform_key}
      }
    end
        
    def base_endpoint
      endpoint + "/" + api_path_prefix + "/"
    end
    
  end
end