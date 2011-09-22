require 'rspec'
require 'heroku/plugins/heroku_domainr'

describe Heroku::Plugins::Domainr do
  before do
    class DomainrImpl
      include Heroku::Plugins::Domainr
    end

    Heroku::Plugins::Domainr.config do |c|
      c.heroku_app   = "app_name"
      c.heroku_user  = "jan"
      c.heroku_pass  = "haslo"
    end

    @domainr = DomainrImpl.new
    @fake_heroku_client = Object.new
    @domainr.stub(:heroku_client) { @fake_heroku_client }
  end

  it "should call heroku add domain with app name and domain" do
    @fake_heroku_client.should_receive(:add_domain).with("app_name", 'alamakota')
    @domainr.domains_add("alamakota")
  end

  it "should call heroku remove domain with app name and domain" do
    @fake_heroku_client.should_receive(:remove_domain).with("app_name", "alamialakota")
    @domainr.domains_remove("alamialakota")
  end

  it "should call heroku remove domains with app name" do
    @fake_heroku_client.should_receive(:remove_domains).with("app_name")
    @domainr.domains_clear()
  end

  it "should not call heroku client if app name is not specified" do
    Heroku::Plugins::Domainr.config do |c|
      c.heroku_app   = ""
    end
    @domainr.domains_add("alamakota")
    @domainr.domains_remove("alamakota")
    @domainr.domains_clear()
  end
end