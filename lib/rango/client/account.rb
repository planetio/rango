module Rango
  class Client
    module Account
      def create(customer, account, email)
        post("/accounts", customer: customer, identifier: account, email: email)
      end
    end
  end
end