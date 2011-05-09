$LOAD_PATH.unshift 'lib'
require 'heroku/plugins/domainr/version'

Gem::Specification.new do |s|
  s.name                     = "heroku-domainr"
  s.date                     = Time.now.strftime('%Y-%m-%d')
  s.version                  = Heroku::Plugins::Domainr::VERSION
  s.summary                  = "Heroku plugin to manage heroku domains from the heroku application"
  s.homepage                 = "https://github.com/managr/heroku-domainr"
  s.authors                  = ["Marcin Naglik"]
  s.email                    = "marcin.naglik@gmail.com"

  s.files                    = %w( README.md MIT.LICENSE GEMFILE )
  s.files                    += Dir.glob("lib/**/*")
  s.files                    += Dir.glob("spec/**/*")

  s.add_dependency "heroku"

  s.description       = <<desc
This gem adds Heroku domains management to the heroku application.
desc
end