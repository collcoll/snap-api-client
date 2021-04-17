# frozen_string_literal: true

module SnapAPIClient
  # General
  class ConfigurationError < StandardError; end

  # HTTP
  class HttpResponseError < StandardError; end
  class HttpBadRequestError < HttpResponseError; end
  class HttpUnauthorizedError < HttpResponseError; end
  class HttpForbiddenError < HttpResponseError; end
  class HttpNotFoundError < HttpResponseError; end
  class HttpUnprocessableEntityError < HttpResponseError; end
  class HttpLockedError < HttpResponseError; end
  class HttpInternalServerError < HttpResponseError; end
end
