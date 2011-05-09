require 'rspec'
require 'heroku/plugins/heroku_domainr'

RSpec.configure do |config|
  config.mock_with :rr
end

Heroku::Plugins::Domainr.config do |c|
  c.heroku_app  = "app_name"
end

class DomainrImpl
  include Heroku::Plugins::Domainr
end

describe Heroku::Plugins::Domainr do
  before do
    @domainr = DomainrImpl.new
    @fake_heroku_client = Object.new
    stub(@domainr).heroku_client{ @fake_heroku_client }
  end

  it "should call heroku add domain with app name and domain" do
    mock(@fake_heroku_client).add_domain("app_name", "alamakota")
    @domainr.domains_add("alamakota")
  end

  it "should call heroku remove domain with app name and domain" do
    mock(@fake_heroku_client).remove_domain("app_name", "alamialakota")
    @domainr.domains_remove("alamialakota")
  end

  it "should call heroku remove domains with app name" do
    mock(@fake_heroku_client).remove_domains("app_name")
    @domainr.domains_clear()
  end
end