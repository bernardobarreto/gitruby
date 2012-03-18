# encoding: utf-8
require "spec_helper"

describe Org do
  context "without authentication" do
    it 'should be findable by the github name' do
      org = Org.find('ShadowLinux')
      org.type.should == 'Organization'
      org.login.should == 'ShadowLinux'
    end

    it "should convert the hash from api.github to public attributes" do
      org = Org.find('ShadowLinux')
      get_shadow_linux_org.each do |key, value|
        org.public_send(key).should == value
      end
    end

    def get_shadow_linux_org
      {"type"=>"Organization",
      "created_at"=>"2011-07-01T17:57:43Z",
      "avatar_url"=>
        "https://secure.gravatar.com/avatar/58097cc1310f31f3dc95c20386204ed8?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
      "html_url"=>"https://github.com/ShadowLinux",
      "followers"=>0,
      "following"=>0,
      "public_gists"=>0,
      "url"=>"https://api.github.com/orgs/ShadowLinux",
      "id"=>889190,
      "login"=>"ShadowLinux"}
    end

    it 'should not respond to github attributes when there are no results' do
      org = Org.new :foooooobar123
      org.should_not respond_to :login
      org.should_not respond_to :following
      org.should_not respond_to :followers
    end

    it "should be able to return all org's repositories" do
      org = Org.find('ShadowLinux')
      org.public_repos.count.should == 3
      repo = org.public_repos[0]
      repo.name.should == 'ShadowLinux'
    end

    it 'should return a list of all members in a org' do
      org = Org.find('shadowlinux')
      org.members[0].login.should == 'angelonuffer'
    end
  end
end
