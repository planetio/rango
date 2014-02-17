module Rango
  # Wrapper for the Rango REST API
  #
  class Client < API
    # avoid superclass mismatch
    require 'rango/client/accounts'
    require 'rango/client/funds'
    require 'rango/client/orders'
    require 'rango/client/rewards'

    alias :api_endpoint :endpoint

    def accounts(customer=nil, account=nil)
      Accounts.new(self, customer, account)
    end
    
    def funds
      Funds.new(self)
    end
    
    def orders
      Orders.new(self)
    end
    
    def rewards
      Rewards.new(self)
    end

  end
end
