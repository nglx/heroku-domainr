Heroku Domainr
==============

Simple Heroku plugin for managing heroku domains.

This gem adds functionality to add/remove/clear Heroku domains from within the Heroku application.

##Installation

Add the following to your Gemfile:

    gem 'heroku-domainr'

##Setup

In order for the management of the Heroku domains the plugin needs to know your Heroku app credentials. By default they're read from the following env variables:

- HEROKU_APP
- HEROKU_USER
- HEROKU_PASS

You can also setup it using the following initializer:

    require 'heroku/plugins/heroku_domainr'

    Heroku::Plugins::Domainr.config do |c|
      c.heroku_user = 'heroku user'
      c.heroku_pass = 'heroku password'
      c.heroku_app  = 'heroku app'
    end


##Usage

Using the heroku-domainr plugin:

    require 'heroku/plugins/heroku_domainr'

    class SampleRailsClass
      include Heroku::Plugins::Domainr

      def perform_add_domain
        domains_add("my-domain.com")
      end

      def perform_remove_domain
        domains_remove("my-domain.com")
      end

      def perform_clear_domain
        domains_clear
      end
    end
