module Rango
  # Wrapper for the Rango REST API
  #
  class Client < API
    # avoid superclass mismatch
    require 'rango/client/accounts'
    require 'rango/client/rewards'

    alias :api_endpoint :endpoint

    def account
      Accounts.new(self)
    end
    
    def rewards
      Rewards.new(self)
    end

  end
end
