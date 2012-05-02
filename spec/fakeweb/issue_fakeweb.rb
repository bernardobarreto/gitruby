FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world/issues/1',
  :content_type => 'text/json',
  :body => '{
    "closed_by": null,
    "closed_at": null,
    "assignee": null,
    "updated_at": "2012-03-23T14:44:09Z",
    "comments": 0,
    "state": "open",
    "url": "https://api.github.com/repos/octocat/hello-world/issues/1",
    "milestone": null,
    "user": {
      "url": "https://api.github.com/users/octocat",
      "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
      "login": "octocat",
      "id": 583231,
      "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
    },
    "title": "just for test",
    "created_at": "2012-03-23T14:44:09Z",
    "labels": [
    ],
    "number": 1,
    "html_url": "https://github.com/octocat/hello-world/issues/1",
    "body": "leave me alone!",
    "id": 3780876,
    "pull_request": {
      "patch_url": null,
      "html_url": null,
      "diff_url": null
    }
  }')

FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world/issues?page=2',
  :content_type => 'text/json',
  :body => '[{
    "closed_by": null,
    "closed_at": null,
    "assignee": null,
    "updated_at": "2012-03-23T14:44:09Z",
    "comments": 0,
    "state": "open",
    "url": "https://api.github.com/repos/octocat/hello-world/issues/2",
    "milestone": null,
    "user": {
      "url": "https://api.github.com/users/octocat",
      "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
      "login": "octocat",
      "id": 583231,
      "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
    },
    "title": "issue page 2",
    "created_at": "2012-03-23T14:44:09Z",
    "labels": [
    ],
    "number": 1,
    "html_url": "https://github.com/octocat/hello-world/issues/2",
    "body": "leave me alone again!",
    "id": 3780876,
    "pull_request": {
      "patch_url": null,
      "html_url": null,
      "diff_url": null
    }
  }]')
