class Response
  attr_reader :raw_response

  def initialize(raw_response)
    @raw_response = raw_response
  end

  def response
    @raw_response.body
  end

  def success?
    response["success"] == true
  end

  def error_message
    response["error_message"]
  end

  def input_errors
    response["invalid_inputs"].inject({}){|hash, input| 
      hash[input["field"]] = input["error"]
      hash
    } unless response["invalid_inputs"].nil?
  end
  alias :errors :input_errors

  def input_error_messages
    response["invalid_inputs_message"].split(". ") unless response["invalid_inputs_message"].nil?
  end

end