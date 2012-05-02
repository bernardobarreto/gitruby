FakeWeb.register_uri(
  :get, 'https://api.github.com/orgs/github',
  :content_type => 'text/json',
  :body => '{
    "created_at": "2008-05-11T04:37:31Z",
    "type": "Organization",
    "location": "San Francisco, CA",
    "public_repos": 2,
    "html_url": "https://github.com/github",
    "url": "https://api.github.com/orgs/github",
    "public_gists": 1,
    "company": null,
    "email": "support@github.com",
    "avatar_url": "https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
    "followers": 2,
    "following": 0,
    "name": "GitHub",
    "blog": "https://github.com/about",
    "id": 9919,
    "login": "github"
  }')

FakeWeb.register_uri(
  :get, 'https://api.github.com/orgs/github/repos',
  :content_type => 'text/json',
  :body => '[{
    "has_issues": false,
    "created_at": "2010-08-24T19:16:26Z",
    "forks": 1,
    "language": "Ruby",
    "clone_url": "https://github.com/github/project.git",
    "owner": {
      "url": "https://api.github.com/users/github",
      "avatar_url": "https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
      "gravatar_id": "61024896f291303615bcd4f7a0dcfb74",
      "id": 9919,
      "login": "github"
    },
    "html_url": "https://github.com/github/project",
    "url": "https://api.github.com/repos/github/project",
    "mirror_url": null,
    "has_wiki": true,
    "ssh_url": "git@github.com:github/project.git",
    "open_issues": 0,
    "description": "test project",
    "watchers": 2,
    "size": 296,
    "fork": true,
    "git_url": "git://github.com/github/project.git",
    "pushed_at": "2010-08-24T19:41:38Z",
    "updated_at": "2011-11-18T01:46:27Z",
    "name": "project",
    "svn_url": "https://github.com/github/project",
    "private": false,
    "id": 859835,
    "has_downloads": true,
    "homepage": ""
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/orgs/github/repos?page=2',
  :content_type => 'text/json',
  :body => '[{
    "open_issues": 77,
    "svn_url": "https://github.com/github/gitignore",
    "pushed_at": "2012-03-19T18:52:35Z",
    "created_at": "2010-11-08T20:17:14Z",
    "description": "A collection of useful .gitignore templates",
    "html_url": "https://github.com/github/gitignore",
    "has_downloads": true,
    "watchers": 4748,
    "clone_url": "https://github.com/github/gitignore.git",
    "url": "https://api.github.com/repos/github/gitignore",
    "fork": false,
    "size": 224,
    "homepage": "",
    "git_url": "git://github.com/github/gitignore.git",
    "private": false,
    "has_wiki": false,
    "has_issues": false,
    "updated_at": "2012-04-16T19:00:39Z",
    "owner": {
      "avatar_url": "https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
      "url": "https://api.github.com/users/github",
      "login": "github",
      "gravatar_id": "61024896f291303615bcd4f7a0dcfb74",
      "id": 9919
    },
    "name": "gitignore",
    "forks": 643,
    "ssh_url": "git@github.com:github/gitignore.git",
    "id": 1062897,
    "mirror_url": null,
    "language": null
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/orgs/github/members',
  :content_type => 'text/json',
  :body => '[{
    "url": "https://api.github.com/users/octocat",
    "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
    "login": "octocat",
    "id": 583231,
    "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
  }]')

FakeWeb.register_uri(
  :get, 'https://api.github.com/orgs/github/members?page=2',
  :content_type => 'text/json',
  :body => '[{
    "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "octopus",
    "url": "https://api.github.com/users/octopus",
    "gravatar_id": "82b341477c74888442fe70db563dac26",
    "id": 824254
  }]')
