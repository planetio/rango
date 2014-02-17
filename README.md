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
    client = Rango::Client.new
    
    
Troubleshooting
----------------
Rango uses RestClient, so you can visit https://github.com/rest-client/rest-client for more options.

You can enable logging via:
    RESTCLIENT_LOG=stdout rails c
