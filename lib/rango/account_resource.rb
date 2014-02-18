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

    def set_customer_account!(args)
      self.customer = args.shift unless self.customer.present?
      self.account = args.shift unless self.account.present?
    end
    
    def get(*args)
      ensure_customer_and_account!
      super
    end
    
    def post(*args)
      ensure_customer_and_account!
      super
    end
    
    private
    def ensure_customer_and_account!
      raise "Invalid Request: Customer and account have not been specified and are required for this request!" unless self.customer.present? and self.account.present?
    end
  end
end