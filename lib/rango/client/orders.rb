module Rango
  class Client
    class Orders < AccountResource
            
      # (customer, account, recipient, gift card sku, options)
      # (recipient, gift card sku, options)
      # Options: 
      #   amount: options[:amount] 
      #   reward_from: options[:reward_from]
      #   reward_subject: options[:reward_subject] 
      #   reward_message: options[:reward_message]
      #   send_reward: options[:send_reward_email]
      def create(*args)
        set_customer_account!(args) 
        recipient, sku, options = *args       
        post "/", order_params(recipient, sku, options) 
      end
      
      def list(*args)
        set_customer_account!(args) 
        get "/",
          customer: customer,
          account_identifier: account
      end
      
      private
      def order_params(recipient, sku, options={})
        params = {
          customer: customer, 
          account_identifier: account,
          recipient: recipient,
          sku: sku
        }
        params.merge(options)
      end
    end
  end
end