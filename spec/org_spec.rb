# encoding: utf-8
require "spec_helper"
include FakeWebHelper

describe Org do
  context "without authentication" do
    it 'should be findable by the github name' do
      org = Org.find('cobrateam')
      org.type.should == 'Organization'
      org.login.should == 'cobrateam'
    end

    it "should convert the hash from api.github to public attributes" do
      org = Org.find('cobrateam')
      get_cobrateam_org.each do |key, value|
        org.public_send(key).should == value
      end
    end

    def get_cobrateam_org
      {"following"=>0,
      "type"=>"Organization",
      "login"=>"cobrateam",
      "blog"=>"http://cobrateam.info/",
      "location"=>"Rio de Janeiro",
      "url"=>"https://api.github.com/orgs/cobrateam",
      "company"=>nil,
      "public_gists"=>0,
      "created_at"=>"2010-09-17T04:12:13Z",
      "email"=>nil,
      "html_url"=>"https://github.com/cobrateam",
      "name"=>"cobra team",
      "followers"=>8,
      "id"=>403905,
      "avatar_url"=>
        "https://secure.gravatar.com/avatar/1748a027361ab3e3a7f6515ac0319271?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png"}
    end

    it 'should not respond to github attributes when there are no results' do
      org = Org.new :foooooobar123
      org.should_not respond_to :login
      org.should_not respond_to :following
      org.should_not respond_to :followers
    end

    it "should be able to return all org's repositories" do
      org = Org.find('cobrateam')
      org.public_repos.count.should == 1
      repo = org.public_repos[0]
      repo.name.should == 'splinter'
    end

    it 'should return a list of all members in a org' do
      org = Org.find('cobrateam')
      org.members[0].login.should == 'octocat'
    end
  end
end
