# frozen_string_literal: true

module SnapAPIClient
  module Resources
    class Card < Base
      def update_review_url(id, url)
        transport.patch("/cards/#{id}/review", {
                          card: {
                            review_url: url
                          }
                        })
      end
    end
  end
end
