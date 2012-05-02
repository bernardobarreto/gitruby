FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world',
  :content_type => 'text/json',
  :body => '{
    "has_downloads": true,
    "homepage": "",
    "svn_url": "https://github.com/octocat/hello-world",
    "has_issues": true,
    "updated_at": "2012-04-02T14:59:26Z",
    "forks": 1,
    "url": "https://api.github.com/repos/octocat/hello-world",
    "language": null,
    "fork": false,
    "clone_url": "https://github.com/octocat/hello-world.git",
    "ssh_url": "git@github.com:octocat/hello-world.git",
    "has_wiki": true,
    "git_url": "git://github.com/octocat/hello-world.git",
    "size": 96,
    "private": false,
    "created_at": "2011-01-26T19:01:12Z",
    "html_url": "https://github.com/octocat/hello-world",
    "owner": {
      "login": "octocat",
      "url": "https://api.github.com/users/octocat",
      "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
      "id": 583231,
      "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
    },
    "name": "hello-world",
    "open_issues": 1,
    "mirror_url": null,
    "description": "This your first repo!",
    "id": 1296269,
    "watchers": 2,
    "pushed_at": "2012-03-06T23:06:51Z"
  }')

FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world/issues',
  :content_type => 'text/json',
  :body => '[{
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
    "labels": [],
    "number": 1,
    "html_url": "https://github.com/octocat/hello-world/issues/1",
    "body": "leave me alone!",
    "id": 3780876,
    "pull_request": {
      "patch_url": null,
      "html_url": null,
      "diff_url": null
    }
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world/forks',
  :content_type => 'text/json',
  :body => '[{
    "has_downloads": true,
    "homepage": "",
    "svn_url": "https://github.com/octopus/hello-world",
    "has_issues": false,
    "updated_at": "2012-04-02T17:47:49Z",
    "forks": 0,
    "html_url": "https://github.com/octopus/hello-world",
    "url": "https://api.github.com/repos/octopus/hello-world",
    "language": null,
    "fork": true,
    "clone_url": "https://github.com/octopus/hello-world.git",
    "ssh_url": "git@github.com:octopus/hello-world.git",
    "git_url": "git://github.com/octopus/hello-world.git",
    "has_wiki": true,
    "mirror_url": null,
    "size": 168,
    "private": false,
    "created_at": "2012-04-02T17:47:49Z",
    "owner": {
      "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
      "login": "octopus",
      "url": "https://api.github.com/users/octopus",
      "gravatar_id": "82b341477c74888442fe70db563dac26",
      "id": 824254
    },
    "name": "hello-world",
    "open_issues": 0,
    "description": "This your first repo!",
    "id": 3906488,
    "watchers": 1,
    "pushed_at": "2012-03-06T23:06:51Z"
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world/forks?page=2',
  :content_type => 'text/json',
  :body => '[{
    "has_downloads": true,
    "homepage": "",
    "svn_url": "https://github.com/octodog/hello-world",
    "has_issues": false,
    "updated_at": "2012-04-02T17:47:49Z",
    "forks": 0,
    "html_url": "https://github.com/octodog/hello-world",
    "url": "https://api.github.com/repos/octodog/hello-world",
    "language": null,
    "fork": true,
    "clone_url": "https://github.com/octodog/hello-world.git",
    "ssh_url": "git@github.com:octodog/hello-world.git",
    "git_url": "git://github.com/octodog/hello-world.git",
    "has_wiki": true,
    "mirror_url": null,
    "size": 168,
    "private": false,
    "created_at": "2012-04-02T17:47:49Z",
    "owner": {
      "avatar_url": "https://secure.gravatar.com/avatar/ba75dfc160b255796e769759ef482960?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
      "login": "octodog",
      "url": "https://api.github.com/users/octodog",
      "gravatar_id": "d0617cc5f99782ba67bcfc73eedf7519",
      "id": 492542
    },
    "name": "hello-world",
    "open_issues": 0,
    "description": "This your first repo!",
    "id": 3906488,
    "watchers": 1,
    "pushed_at": "2012-03-06T23:06:51Z"
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world/collaborators',
  :content_type => 'text/json',
  :body => '[{
    "url": "https://api.github.com/users/octocat",
    "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
    "login": "octocat",
    "id": 583231,
    "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/repos/octocat/hello-world/collaborators?page=2',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/ba75dfc160b255796e769759ef482960?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "octodog",
    "url": "https://api.github.com/users/octodog",
    "gravatar_id": "d0617cc5f99782ba67bcfc73eedf7519",
    "id": 492542
  }]')
