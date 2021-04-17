# frozen_string_literal: true

require 'http'

module SnapAPIClient
  # = Transport
  #
  # Transport wrapper for the HTTP library.
  class Transport
    RESPONSE_ERRORS = {
      400 => HttpBadRequestError,
      401 => HttpUnauthorizedError,
      403 => HttpForbiddenError,
      404 => HttpNotFoundError,
      422 => HttpUnprocessableEntityError,
      500 => HttpInternalServerError
    }.freeze

    def get(path, parameters = {}, headers = {})
      do_request!(:get, path, :params, parameters, headers)
    end

    def post(path, parameters = {}, headers = {})
      do_request!(:post, path, :json, parameters, headers)
    end

    def patch(path, parameters = {}, headers = {})
      do_request!(:patch, path, :json, parameters, headers)
    end

    def delete(path, parameters = {}, headers = {})
      do_request!(:delete, path, :params, parameters, headers)
    end

    private

    def configuration
      SnapAPIClient.configuration
    end

    def do_request!(type, path, parameters_type, parameters, headers)
      response = make_http_call(type, path, parameters_type, parameters, headers)
      filter_error_response!(response)
      Response.new(response)
    end

    def make_http_call(type, path, parameters_type, parameters, headers)
      HTTP
        .headers(build_headers(headers))
        .public_send(type, build_url(path), parameters_type => build_parameters(parameters))
    end

    def build_url(path)
      "#{configuration.base_url}#{path}"
    end

    def build_headers(headers)
      {
        accept: 'application/json',
        authorization: "Token token=#{configuration.authentication_token}"
      }.merge(headers)
    end

    def build_parameters(parameters)
      parameters.reject { |_, value| value.nil? }
    end

    def filter_error_response!(response)
      exception_class = RESPONSE_ERRORS[response.status.code]
      exception_class ? raise(exception_class, response) : response
    end
  end
end
