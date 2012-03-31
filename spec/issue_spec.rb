# encoding: utf-8
require "spec_helper"

describe Issue do
  context "without authentication" do
    it 'should return a specific issue' do
      issue = Issue.find('janelas', 'guilhermeportoes', 1)
      issue.title.should == 'this is a issue'
    end

    it "should convert the hash from api.github to public attributes" do
      issue = Issue.find('janelas', 'guilhermeportoes', 1)
      get_janelas_first_issue.each do |key, value|
        issue.public_send(key).should == value
      end
    end

    def get_janelas_first_issue
      {"closed_by"=>nil,
      "updated_at"=>"2012-03-18T21:48:23Z",
      "comments"=>1,
      "state"=>"open",
      "assignee"=>nil,
      "url"=>"https://api.github.com/repos/guilhermeportoes/janelas/issues/1",
      "user"=>
        {"url"=>"https://api.github.com/users/firetest",
        "avatar_url"=>
          "https://secure.gravatar.com/avatar/1b91afd28bd4383be5e460b7a6c8c5ea?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
        "gravatar_id"=>"1b91afd28bd4383be5e460b7a6c8c5ea",
        "id"=>1538901,
        "login"=>"firetest"},
      "title"=>"this is a issue",
      "html_url"=>"https://github.com/guilhermeportoes/janelas/issues/1",
      "created_at"=>"2012-03-18T21:41:31Z",
      "milestone"=>nil,
      "labels"=>[],
      "number"=>1,
      "body"=>"this is the issue comment",
      "closed_at"=>nil,
      "id"=>3702748,
      "pull_request"=>{"diff_url"=>nil, "patch_url"=>nil, "html_url"=>nil}}
    end
  end
end
