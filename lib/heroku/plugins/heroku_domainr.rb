require 'heroku/plugins/domainr/config'

module Heroku
  module Plugins
    module Domainr
      @@heroku_client


      def self.config
        yield Heroku::Plugins::Domainr::Config
      end

      private

    end
  end
end