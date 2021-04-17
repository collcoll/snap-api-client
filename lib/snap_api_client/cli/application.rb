# frozen_string_literal: true

module SnapAPIClient
  module CLI
    class Application < Thor
      def self.exit_on_failure?
        true
      end

      desc 'cards',
           'Perform actions on specific cards'
      subcommand 'cards', Cards
    end
  end
end
