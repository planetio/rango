module Rango
  class Resource
    attr_reader :client
    
    def initialize(client)
      @client = client
    end
    
    def get(*args)
      client.get(resource_path, *args)
    end
    
    def post(*args)
      client.post(resource_path, *args)
    end
    
    private
    def resource_path
      self.class.name.demodulize.underscore
    end
  end
end