require 'heroku'
require 'heroku/plugins/domainr/config'

module Heroku
  module Plugins
    module Domainr
      @@heroku_client = nil

      def domains_add(domain)
        unless config_not_defined?
          heroku_client.add_domain(Heroku::Plugins::Domainr::Config.heroku_app, domain)
        else
          log("Skipping domain #{domain} creation because config is not defined")
        end
      end

      def domains_remove(domain)
        unless config_not_defined?
          heroku_client.remove_domain(Heroku::Plugins::Domainr::Config.heroku_app, domain)
        else
          log("Skipping domain #{domain} removal because config is not defined")
        end
      end

      def domains_clear()
        unless config_not_defined?
          heroku_client.remove_domains(Heroku::Plugins::Domainr::Config.heroku_app)
        else
          log("Skipping domain clearing because config is not defined")
        end
      end

      def heroku_client
        unless config_not_defined?
          @@heroku_client || @@heroku_client = Heroku::Client.new(Heroku::Plugins::Domainr::Config.heroku_user,
                                                                  Heroku::Plugins::Domainr::Config.heroku_pass)
        end
      end

      def self.config
        yield Heroku::Plugins::Domainr::Config
      end

      private
      def config_not_defined?
        Heroku::Plugins::Domainr::Config.heroku_user.nil? || Heroku::Plugins::Domainr::Config.heroku_pass.nil? || Heroku::Plugins::Domainr::Config.heroku_app.nil?
      end

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