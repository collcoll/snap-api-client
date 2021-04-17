# frozen_string_literal: true

module SnapAPIClient
  module Resources
    class Base
      attr_reader :transport

      def initialize(transport)
        @transport = transport
      end
    end
  end
end
