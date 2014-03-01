require 'unirest'

module Rango
  module Request

    def client
      Unirest
    end

    def get(*args)
      resource = format_resource(args.shift)
      resource += "?#{format_get_params(*args)}" if args.present?
      params = default_options
      respond client.get(resource, params)
    end
    
    def post(*args)
      resource = format_resource(args.shift)
      params = format_post_params(*args)
      respond client.post(resource, params)
    end

    def respond( response )
      Response.new response
    end
    
    private
        
    def format_resource(resource)
      base_endpoint + resource
    end
    
    def format_post_params(request_params={}, opts={})
      params = default_options
      params[:parameters] = request_params.to_json if request_params.present?
      params.merge(opts)
    end

    def format_get_params(request_params={})
      URI.encode_www_form(request_params)
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