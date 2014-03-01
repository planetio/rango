module Rango
  class Client
    class Funds < AccountResource
            
      # (customer, account, amount, ip, credit_card)
      # (amount, ip, credit_card)      
      def add(*args)
        set_customer_account!(args) 
        amount, ip, credit_card = *args       
        post "/", 
          customer: customer, 
          account_identifier: account, 
          amount: amount.to_i,
          client_ip: ip,
          credit_card: credit_card
      end
      
    end
  end
end