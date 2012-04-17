# encoding: utf-8
require "spec_helper"

describe Repo do
  context "without authentication" do
    it "should be findable by the github username/repository" do
      repo = Repo.find('octocat', 'hello-world')
      repo.name.should == 'hello-world'
      repo.html_url.should == 'https://github.com/octocat/hello-world'
    end

    it "should convert the hash from api.github to public attributes" do
      repo = Repo.find('octocat', 'hello-world')
      get_hello_world_repo.each do |key, value|
        repo.public_send(key).should == value
      end
    end

    def get_hello_world_repo
      {"has_downloads?"=>true,
      "homepage"=>"",
      "svn_url"=>"https://github.com/octocat/hello-world",
      "has_issues?"=>true,
      "updated_at"=>"2012-04-02T14:59:26Z",
      "url"=>"https://api.github.com/repos/octocat/hello-world",
      "language"=>nil,
      "fork?"=>false,
      "clone_url"=>"https://github.com/octocat/hello-world.git",
      "ssh_url"=>"git@github.com:octocat/hello-world.git",
      "has_wiki?"=>true,
      "git_url"=>"git://github.com/octocat/hello-world.git",
      "size"=>96,
      "private?"=>false,
      "created_at"=>"2011-01-26T19:01:12Z",
      "html_url"=>"https://github.com/octocat/hello-world",
      "owner"=>
        {"login"=>"octocat",
        "url"=>"https://api.github.com/users/octocat",
        "gravatar_id"=>"7ad39074b0584bc555d0417ae3e7d974",
        "id"=>583231,
        "avatar_url"=>
          "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"},
      "name"=>"hello-world",
      "open_issues"=>1,
      "mirror_url"=>nil,
      "description"=>"This your first repo!",
      "id"=>1296269,
      "watchers"=>2,
      "pushed_at"=>"2012-03-06T23:06:51Z"}
    end

    it 'should not respond to github attributes when there are no results' do
      repo = Repo.new :foooooobar123
      repo.should_not respond_to :login
      repo.should_not respond_to :following
      repo.should_not respond_to :followers
    end

    it 'should returns a list of repository collaborators' do
      repo = Repo.find('octocat', 'hello-world')
      repo.collaborators[0].login.should == 'octocat'
    end

    it 'forks should return a list of repos objects' do
      repo = Repo.find('octocat', 'hello-world')
      repo_fork = repo.forks[0]
      repo_fork.fork?.should == true
      repo_fork.owner['login'].should == 'octopus'
    end

    it 'forks should accept api url options' do
      repo = Repo.find('octocat', 'hello-world')
      repo_fork = repo.forks(page: 2)[0]
      repo_fork.fork?.should == true
      repo_fork.owner['login'].should == 'octodog'
    end

    it 'should return a list of issues objects' do
      repo = Repo.find('octocat', 'hello-world')
      issue = repo.issues[0]
      issue.title.should == 'just for test'
    end

    it 'collaborators should support api url options' do
      repo = Repo.find('octocat', 'hello-world')
      user = repo.collaborators(page: 2)[0]
      user.login.should == 'octodog'
    end
  end
end
