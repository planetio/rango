module Rango
  class Client
    module Account
      def create(customer, account, email)
        client.post("/accounts", customer: customer, account: account, email: email)
      end
    end
  end
end