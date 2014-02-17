module Rango
  class Client
    class Accounts < Resource
      
      def create(customer, account, email)
        post(customer: customer, identifier: account, email: email)
      end
      
    end
  end
end