module Rango
  class Client
    class Accounts < Resource
      
      def find(customer, account)
        get "/#{customer}/#{account}"
      end
      
      def create(customer, account, email)
        post "/", customer: customer, identifier: account, email: email
      end
      
    end
  end
end