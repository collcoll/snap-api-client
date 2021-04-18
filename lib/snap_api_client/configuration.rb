# frozen_string_literal: true

module SnapAPIClient
  # = Configuration
  #
  # Configuration object to be used throughout the library.
  class Configuration
    attr_accessor :base_url,
                  :authentication_token
  end
end
