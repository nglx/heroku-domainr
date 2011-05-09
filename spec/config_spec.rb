require 'rspec'
require 'heroku/plugins/domainr/config'

describe Heroku::Plugins::Domainr::Config do
  describe "heroku_user" do
    it "stores the given heroku user name" do
      subject.heroku_user = "user@example.com"
      subject.heroku_user.should == "user@example.com"
    end

    it "defaults to HEROKU_USER environment variable" do
      subject.heroku_user = nil
      ENV["HEROKU_USER"]  = "other-user@example.com"
      subject.heroku_user.should == "other-user@example.com"
    end
  end

  describe "heroku_pass" do
    it "stores the given heroku password" do
      subject.heroku_pass = "password"
      subject.heroku_pass.should == "password"
    end

    it "defaults to HEROKU_PASS environment variable" do
      subject.heroku_pass = nil
      ENV["HEROKU_PASS"]  = "other-password"
      subject.heroku_pass.should == "other-password"
    end
  end

  describe "heroku_app" do
    it "stores the given heroku application name" do
      subject.heroku_app = "my-app"
      subject.heroku_app.should == "my-app"
    end

    it "defaults to HEROKU_APP environment variable" do
      subject.heroku_app = nil
      ENV["HEROKU_APP"]  = "my-other-app"
      subject.heroku_app.should == "my-other-app"
    end
  end
end
