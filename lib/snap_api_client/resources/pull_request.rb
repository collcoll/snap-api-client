# frozen_string_literal: true

module SnapAPIClient
  module Resources
    class PullRequest < Base
      def create_import_request(repository_name, number)
        transport.post('/pull_requests', {
                         pull_request: {
                           repository_name: repository_name,
                           number: number
                         }
                       })
      end
    end
  end
end
