require 'heroku/plugins/domainr/config'

module Heroku
  module Plugins
    module Domainr
      @@heroku_client

      def domains_add(domain)
        heroku_client.add_domain(Heroku::Plugins::Domainr::Config.heroku_app, domain)
      end

      def domains_remove(domain)
        heroku_client.remove_domain(Heroku::Plugins::Domainr::Config.heroku_app, domain)
      end

      def domains_clear()
        heroku_client.remove_domains(Heroku::Plugins::Domainr::Config.heroku_app)
      end

      def heroku_client
        @@heroku_client ||= Heroku::Client.new(Heroku::Plugins::Domainr::Config.heroku_user,
                                               Heroku::Plugins::Domainr::Config.heroku_pass)
      end

      def self.config
        yield Heroku::Plugins::Domainr::Config
      end

      private

      def log(message)
        if defined?(Rails)
          Rails.logger.info(message)
        else
          puts message
        end
      end
    end
  end
end