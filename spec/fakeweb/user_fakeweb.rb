FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octopus',
  :content_type => 'text/json',
  :body => '{
    "following": 1,
    "type": "User",
    "login": "octopus",
    "public_gists": 2,
    "blog": "octopus.com",
    "location": "RJ",
    "url": "https://api.github.com/users/octopus",
    "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "public_repos": 1,
    "company": "github",
    "hireable": true,
    "created_at": "2011-06-01T23:14:57Z",
    "email": "octopus@github.com",
    "bio": "developer",
    "html_url": "https://github.com/octopus",
    "name": "octopus",
    "gravatar_id": "82b341477c74888442fe70db563dac26",
    "followers": 1,
    "id": 824254
  }')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat',
  :content_type => 'text/json',
  :body => '{
    "followers": 1,
    "following": 1,
    "type": "User",
    "login": "octocat",
    "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "public_repos": 1,
    "hireable": false,
    "blog": "http://www.github.com/blog",
    "location": "San Francisco",
    "bio": null,
    "url": "https://api.github.com/users/octocat",
    "company": "GitHub",
    "created_at": "2011-01-25T18:44:36Z",
    "email": "octocat@github.com",
    "name": "The Octocat",
    "public_gists": 4,
    "id": 583231,
    "html_url": "https://github.com/octocat",
    "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974"
  }')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/repos',
  :content_type => 'text/json',
  :body => '[{
    "open_issues": 2,
    "watchers": 1,
    "pushed_at": "2012-03-06T23:06:51Z",
    "homepage": "",
    "updated_at": "2012-04-01T17:02:06Z",
    "has_downloads": true,
    "svn_url": "https://github.com/octocat/hello-world",
    "url": "https://api.github.com/repos/octocat/hello-world",
    "has_issues": true,
    "language": null,
    "fork": false,
    "ssh_url": "git@github.com:octocat/hello-world.git",
    "forks": 1,
    "html_url": "https://github.com/octocat/hello-world",
    "size": 168,
    "clone_url": "https://github.com/octocat/hello-world.git",
    "private": false,
    "created_at": "2011-01-26T19:01:12Z",
    "has_wiki": true,
    "owner": {
      "login": "octocat",
      "url": "https://api.github.com/users/octocat",
      "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
      "id": 583231,
      "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974"
    },
    "name": "hello-world",
    "description": "This your first repo!",
    "id": 1296269,
    "mirror_url": null,
    "git_url": "git://github.com/octocat/hello-world.git"
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/repos?page=2',
  :content_type => 'text/json',
  :body => '[{
    "open_issues": 2,
    "watchers": 1,
    "pushed_at": "2012-03-06T23:06:51Z",
    "homepage": "",
    "updated_at": "2012-04-01T17:02:06Z",
    "has_downloads": true,
    "svn_url": "https://github.com/octocat/foobar",
    "url": "https://api.github.com/repos/octocat/foobar",
    "has_issues": true,
    "language": null,
    "fork": false,
    "ssh_url": "git@github.com:octocat/foobar.git",
    "forks": 1,
    "html_url": "https://github.com/octocat/foobar",
    "size": 168,
    "clone_url": "https://github.com/octocat/foobar.git",
    "private": false,
    "created_at": "2011-01-26T19:01:12Z",
    "has_wiki": true,
    "owner": {
      "login": "octocat",
      "url": "https://api.github.com/users/octocat",
      "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
      "id": 583231,
      "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974"
    },
    "name": "foobar",
    "description": "This the foobar repo",
    "id": 62162,
    "mirror_url": null,
    "git_url": "git://github.com/octocat/foobar.git"
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/followers',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "octopus",
    "url": "https://api.github.com/users/octopus",
    "gravatar_id": "82b341477c74888442fe70db563dac26",
    "id": 824254
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/followers?page=2',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/ba75dfc160b255796e769759ef482960?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "octodog",
    "url": "https://api.github.com/users/octodog",
    "gravatar_id": "d0617cc5f99782ba67bcfc73eedf7519",
    "id": 492542
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/following',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "octopus",
    "url": "https://api.github.com/users/octopus",
    "gravatar_id": "82b341477c74888442fe70db563dac26",
    "id": 824254
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/following?page=2',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/ba75dfc160b255796e769759ef482960?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "octodog",
    "url": "https://api.github.com/users/octodog",
    "gravatar_id": "d0617cc5f99782ba67bcfc73eedf7519",
    "id": 492542
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/orgs',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
    "login": "github",
    "url": "https://api.github.com/orgs/github",
    "id": 9919
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/users/octocat/orgs?page=2',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/1748a027361ab3e3a7f6515ac0319271?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
    "login": "linux",
    "url": "https://api.github.com/orgs/linux",
    "id": 403905
  }]')
