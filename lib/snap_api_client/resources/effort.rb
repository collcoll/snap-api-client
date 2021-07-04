# frozen_string_literal: true

module SnapAPIClient
  module Resources
    class Effort < Base
      def update_review_url(id, url)
        transport.patch("/efforts/#{id}/review", {
                          effort: {
                            review_url: url
                          }
                        })
      end
    end
  end
end
