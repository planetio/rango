module Rango
  # Wrapper for the Rango REST API
  #
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'rango/client/account'

    alias :api_endpoint :endpoint

    include Rango::Client::Account
  end
end
