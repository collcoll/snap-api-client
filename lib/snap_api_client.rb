# frozen_string_literal: true

require 'snap_api_client/configuration'
require 'snap_api_client/errors'
require 'snap_api_client/response'
require 'snap_api_client/resources'
require 'snap_api_client/transport'
require 'snap_api_client/version'

# = Snap API Client
#
# API client library for consuming Snap API resources
#
# @see SnapAPIClient::Configuration
# @see SnapAPIClient::Transport
# @see SnapAPIClient::Response
module SnapAPIClient
  module_function

  attr_writer :transport

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield(configuration) if block_given?
  end

  def transport
    @transport ||= Transport.new
  end

  def card_resource
    @card_resource ||= Resources::Card.new(transport)
  end
end
