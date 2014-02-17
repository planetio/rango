module Rango
  class AccountResource < Resource
    attr_accessor :customer, :account
    RESOURCES = [:accounts, :funds, :orders]

    RESOURCES.each do |resource|
      define_method(resource) do
        resource.to_s.capitalize.constantize.new(customer, account)
      end
    end
    
    def initialize(client, customer=nil, account=nil)
      @customer = customer
      @account = account
      super(client)
    end

    def set_customer_account!(*args)
      self.customer = args.shift
      self.account = args.shift
    end
  end
end