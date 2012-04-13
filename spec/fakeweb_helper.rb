module FakeWebHelper
  require 'fakeweb'
  FakeWeb.allow_net_connect = false

  ################################## Fake for Issue ###############################
  FakeWeb.register_uri(:get, 'https://api.github.com/repos/octocat/hello-world/issues/1',
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

  ################################## Fake for Organization ###############################
  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/github',
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

  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/github/repos',
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

  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/github/members',
                       :content_type => 'text/json',
                       :body => '[
                       {
                          "url": "https://api.github.com/users/octocat",
                          "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
                          "login": "octocat",
                          "id": 583231,
                          "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
                        }]')

  ################################## Fake for User ###############################
  FakeWeb.register_uri(:get, 'https://api.github.com/users/octopus',
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

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat',
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

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/repos',
                       :content_type => 'text/json',
                       :body => '[
                        {
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

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/followers',
                       :content_type => 'text/json',
                       :body => '[{
                          "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                          "login": "octopus",
                          "url": "https://api.github.com/users/octopus",
                          "gravatar_id": "82b341477c74888442fe70db563dac26",
                          "id": 824254
                        }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/followers?page=2',
                       :content_type => 'text/json',
                       :body => '[{
                          "avatar_url": "https://secure.gravatar.com/avatar/ba75dfc160b255796e769759ef482960?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                          "login": "octodog",
                          "url": "https://api.github.com/users/octodog",
                          "gravatar_id": "d0617cc5f99782ba67bcfc73eedf7519",
                          "id": 492542
                        }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/following',
                       :content_type => 'text/json',
                       :body => '[{
                          "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                          "login": "octopus",
                          "url": "https://api.github.com/users/octopus",
                          "gravatar_id": "82b341477c74888442fe70db563dac26",
                          "id": 824254
                        }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/orgs',
                       :content_type => 'text/json',
                       :body => '[{
                          "avatar_url": "https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
                          "login": "github",
                          "url": "https://api.github.com/orgs/github",
                          "id": 9919
                        }]')

  ################################## Fake for Repository ###############################
  FakeWeb.register_uri(:get, 'https://api.github.com/repos/octocat/hello-world',
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

  FakeWeb.register_uri(:get, 'https://api.github.com/repos/octocat/hello-world/issues',
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
                        }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/repos/octocat/hello-world/forks',
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

  FakeWeb.register_uri(:get, 'https://api.github.com/repos/octocat/hello-world/collaborators',
                       :content_type => 'text/json',
                       :body => '[{
                          "url": "https://api.github.com/users/octocat",
                          "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
                          "login": "octocat",
                          "id": 583231,
                          "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
                        }]')

 ################################# Return not found for not registered uri's ###############################
  FakeWeb.register_uri(:get, %r|https://api\.github\.com*|,
                       :content_type => 'text/json',
                       :body => '{
                         "message": "Not Found"
                       }')
end
