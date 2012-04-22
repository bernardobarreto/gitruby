# encoding: utf-8
require "spec_helper"
include FakeWebHelper

describe Org do
  context "without authentication" do
    it 'should be findable by the github name' do
      org = Org.find('github')
      org.type.should == 'Organization'
      org.login.should == 'github'
    end

    it "should convert the hash from api.github to public attributes" do
      org = Org.find('github')
      get_github_org.each do |key, value|
        org.public_send(key).should == value
      end
    end

    def get_github_org
      {"created_at"=>"2008-05-11T04:37:31Z",
      "type"=>"Organization",
      "location"=>"San Francisco, CA",
      "html_url"=>"https://github.com/github",
      "url"=>"https://api.github.com/orgs/github",
      "public_gists"=>1,
      "company"=>nil,
      "email"=>"support@github.com",
      "avatar_url"=>
        "https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
      "followers"=>2,
      "following"=>0,
      "name"=>"GitHub",
      "blog"=>"https://github.com/about",
      "id"=>9919,
      "login"=>"github"}
    end

    it 'should not respond to github attributes when there are no results' do
      org = Org.new(foo: 'bar')
      org.should_not respond_to :login
      org.should_not respond_to :following
      org.should_not respond_to :followers
    end

    it "should be able to return all org's repositories" do
      org = Org.find('github')
      org.public_repos.count.should == 1
      repo = org.public_repos[0]
      repo.name.should == 'project'
    end

    it 'should return a list of all members in a org' do
      org = Org.find('github')
      org.members[0].login.should == 'octocat'
    end

    it 'members should support url api options' do
      org = Org.find('github')
      member = org.members(page: 2)[0]
      member.login.should == 'octopus'
    end

    it 'public repos should support url api options' do
      org = Org.find('github')
      repo = org.public_repos(page: 2)[0]
      repo.name.should == 'gitignore'
    end

    it 'some methods should be lazy' do
      user = User.find('octocat')
      org = user.orgs[0]
      org.should_not respond_to :location
      org.location
      org.should respond_to :location
    end
  end
end
