module Rango
  class Client
    class Orders < AccountResource
            
      # (customer, account, recipient, gift card sku, options)
      # (recipient, gift card sku, options)
      def create(*args)
        set_customer_account!(args) 
        recipient, sku, options = *args       
        post "/", 
          customer: customer, 
          account_identifier: account, 
          campaign: options[:campaign],
          recipient: recipient,
          sku: sku,
          amount: options[:amount],
          reward_from: options[:reward_from],
          reward_subject: options[:reward_subject],
          reward_message: options[:reward_message],
          send_reward: options[:send_reward_email]
      end
      
      def list(*args)
        set_customer_account!(args) 
        get "/",
          customer: customer,
          account_identifier: account
      end
    end
  end
end