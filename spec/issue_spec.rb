# encoding: utf-8
require "spec_helper"
include FakeWebHelper

describe Issue do
  context "without authentication" do
    it 'should return a specific issue' do
      issue = Issue.find('octocat', 'hello-world', 1)
      issue.title.should == 'just for test'
    end

    it "should convert the hash from api into public attributes" do
      issue = Issue.find('octocat', 'hello-world', 1)
      get_hello_world_first_issue.each do |key, value|
        issue.public_send(key).should == value
      end
    end

    def get_hello_world_first_issue
      {"closed_by"=>nil,
      "closed_at"=>nil,
      "assignee"=>nil,
      "updated_at"=>"2012-03-23T14:44:09Z",
      "comments"=>0,
      "state"=>"open",
      "url"=>"https://api.github.com/repos/octocat/hello-world/issues/1",
      "milestone"=>nil,
      "user"=>
        {"url"=>"https://api.github.com/users/octocat",
        "gravatar_id"=>"7ad39074b0584bc555d0417ae3e7d974",
        "login"=>"octocat",
        "id"=>583231,
        "avatar_url"=>
          "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"},
      "title"=>"just for test",
      "created_at"=>"2012-03-23T14:44:09Z",
      "labels"=>[],
      "number"=>1,
      "html_url"=>"https://github.com/octocat/hello-world/issues/1",
      "body"=>"leave me alone!",
      "id"=>3780876,
      "pull_request"=>{"patch_url"=>nil, "html_url"=>nil, "diff_url"=>nil}}
    end
  end
end
