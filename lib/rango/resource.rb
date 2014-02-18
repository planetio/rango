module Rango
  class Resource
    attr_reader :client
    
    def initialize(client)
      @client = client
    end
    
    def get(request_path, params={})
      client.get(resource_path(request_path), params)
    end
    
    def post(request_path, params={})
      client.post(resource_path(request_path), params)
    end
    
    private
    def resource_path(request_path)
      if request_path == "/"
        self.class.name.demodulize.underscore
      else
        self.class.name.demodulize.underscore + request_path
      end
    end
  end
end