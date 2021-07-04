# frozen_string_literal: true

module SnapAPIClient
  module Resources
    class Project < Base
      def update_review_url(id, url)
        transport.patch("/projects/#{id}/review", {
                          project: {
                            review_url: url
                          }
                        })
      end
    end
  end
end
