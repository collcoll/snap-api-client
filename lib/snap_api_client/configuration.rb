# frozen_string_literal: true

module SnapAPIClient
  # = Configuration
  #
  # Configuration object to be used throughout the library.
  class Configuration
    attr_writer :base_url,
                :authentication_token

    def base_url
      @base_url || ENV.fetch('SNAP_API_BASE_URL', 'https://snap.collabcollective.com/api/v1')
    end

    def authentication_token
      @authentication_token || ENV['SNAP_API_TOKEN'] || raise(ConfigurationError, 'no authentication token was found')
    end
  end
end
