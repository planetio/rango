module Rango
  class Client
    class Rewards < Resource
        
      def list
        get "/"
      end
      
    end
  end
end