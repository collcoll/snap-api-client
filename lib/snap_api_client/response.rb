# frozen_string_literal: true

require 'json'

module SnapAPIClient
  # = Response
  #
  # Wrapper for an HTTP response.
  class Response
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def code
      response.status.code
    end

    def body_json
      JSON.parse(response.body)
    end
  end
end
