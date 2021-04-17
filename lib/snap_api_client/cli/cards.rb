# frozen_string_literal: true

module SnapAPIClient
  module CLI
    class Cards < Thor
      desc 'update_review_url CARD_ID URL',
           'Updates the review URL for a given card'
      def update_review_url(card_id, url)
        SnapAPIClient.card_resource.update_review_url(card_id, url)
      end
    end
  end
end
