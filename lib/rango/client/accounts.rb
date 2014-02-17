module Rango
  class Client
    class Accounts < AccountResource
            
      # (customer, account)
      # ()      
      def get(*args)
        set_customer_account!(args)
        get "/#{customer}/#{account}"
      end

      # (customer, account, email)
      # (email)      
      def create(*args)
        set_customer_account!(args)
        email = args[0]
        post "/", customer: customer, identifier: account, email: email
      end
      
    end
  end
end