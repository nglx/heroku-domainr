module Heroku
  module Plugins
    module Domainr
      module Config
        extend self

        attr_writer :heroku_user
        attr_writer :heroku_pass
        attr_writer :heroku_app

        def heroku_user
          @heroku_user || ENV['HEROKU_USER']
        end

        def heroku_pass
          @heroku_pass || ENV['HEROKU_PASS']
        end

        def heroku_app
          @heroku_app || ENV['HEROKU_APP']
        end

      end
    end
  end
end
