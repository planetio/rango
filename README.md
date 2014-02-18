rango
=====

A ruby wrapper to the TangoCard api 

Installation
----------------
    gem install rango

What's new in 0.0.1
----------------
Installation!

Getting Started
----------------
    # config/initializers/rango.rb
    Rango.configure do |config|
      config.platform_id = "TangoTest"
      config.platform_key = "5xItr3dMDlEWAa9S4s7vYh7kQ01d5SFePPUoZZiK/vMfbo3A5BvJLAmD4tI="
      config.endpoint = "https://sandbox.tangocard.com"
    end

Usage
----------------
    There are two apis you can use depending on whether you want to be explicit with accounts or 
    whether you want to save an account object and pass it around.

  ### Explicit Api
  
    # create an account: [customer, account, email]
    Rango.accounts.create("AcmeCo", "HRDept", "hr@acmeco.com")
    
    # Lookup account: [customer, account]
    Rango.accounts.find("AcmeCo", "HRDept")
    
    # Fund account: [customer, account, $5, ip address, credit card]
    # Credit card:
    #   {
    #      "number": "4111111111111111",
    #      "security_code": "123",
    #      "expiration": "03/15",
    #      "billing_address": {
    #        "f_name": "FName",
    #        "l_name": "LName",
    #        "address": "Address",
    #        "city": "Seattle",
    #        "state": "WA",
    #        "zip": "98116",
    #        "country": "USA",
    #        "email": "test@example.com"
    #      }
    #   }    
    Rango.funds.add("AcmeCo", "HRDept", 500, ip, {...})
    
    # List Rewards
    Rango.rewards.list
    
    # Place an order: [customer, account, recipient, gift card sku, options]
    Rango.orders.create("AcmeCo", "HRDept", {name: "John Smith", email: "jsmith@acmeco.com"}, "800F-E-1000-STD", {})
    
  ### Implicit Api
  
    # instantiate an account object, just provides an interface to requests
    # with account details so you can reuse an account object
    account = Rango.accounts("AcmeCo", "HRDept")
    
    # you can create straight off
    account.create
    
    # get order details
    account.fetch
    
    # add funds
    account.funds.add(amount, ip, credit_card)
    
    # place an order
    account.orders.create({name: "John", email: "jsmith@acmeco.com"}, sku, options)
    
    # list orders
    account.orders.list
    
Troubleshooting
----------------
Rango uses RestClient, so you can visit https://github.com/rest-client/rest-client for more options.

You can enable logging via:
    RESTCLIENT_LOG=stdout rails c
