require 'rspec'
require 'heroku/plugins/domainr/config'

describe Heroku::Plugins::Domainr::Config do
  describe ".heroku_user" do
    it "stores the given heroku user name" do
      subject.heroku_user = "my_user@example.com"
      subject.heroku_user.should == "my_user@example.com"
    end

    it "defaults to HEROKU_USER environment variable" do
      subject.heroku_user = nil
      ENV["HEROKU_USER"]  = "user@example.com"
      subject.heroku_user.should == "user@example.com"
    end
  end

  describe ".heroku_pass" do
    it "stores the given heroku password" do
      subject.heroku_pass = "password"
      subject.heroku_pass.should == "password"
    end

    it "defaults to HEROKU_PASS environment variable" do
      subject.heroku_pass = nil
      ENV["HEROKU_PASS"]  = "123"
      subject.heroku_pass.should == "123"
    end
  end

  describe ".heroku_app" do
    it "stores the given heroku application name" do
      subject.heroku_app = "my-grand-app"
      subject.heroku_app.should == "my-grand-app"
    end

    it "defaults to HEROKU_APP environment variable" do
      subject.heroku_app = nil
      ENV["HEROKU_APP"]  = "yaa"
      subject.heroku_app.should == "yaa"
    end
  end
end
