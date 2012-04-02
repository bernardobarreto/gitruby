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
  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/cobrateam',
                       :content_type => 'text/json',
                       :body => '{
                          "following": 0,
                          "type": "Organization",
                          "login": "cobrateam",
                          "public_gists": 0,
                          "public_repos": 1,
                          "html_url": "https://github.com/cobrateam",
                          "location": "Rio de Janeiro",
                          "url": "https://api.github.com/orgs/cobrateam",
                          "company": null,
                          "avatar_url": "https://secure.gravatar.com/avatar/1748a027361ab3e3a7f6515ac0319271?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
                          "created_at": "2010-09-17T04:12:13Z",
                          "email": null,
                          "name": "cobra team",
                          "followers": 8,
                          "blog": "http://cobrateam.info/",
                          "id": 403905
                        }')

  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/cobrateam/repos',
                       :content_type => 'text/json',
                       :body => '[
                        {
                          "has_downloads": true,
                          "homepage": "http://splinter.cobrateam.info/",
                          "svn_url": "https://github.com/cobrateam/splinter",
                          "has_issues": true,
                          "updated_at": "2012-04-02T00:10:50Z",
                          "forks": 41,
                          "url": "https://api.github.com/repos/cobrateam/splinter",
                          "language": "Python",
                          "fork": false,
                          "clone_url": "https://github.com/cobrateam/splinter.git",
                          "ssh_url": "git@github.com:cobrateam/splinter.git",
                          "has_wiki": true,
                          "size": 364,
                          "git_url": "git://github.com/cobrateam/splinter.git",
                          "private": false,
                          "created_at": "2010-09-18T20:59:15Z",
                          "html_url": "https://github.com/cobrateam/splinter",
                          "owner": {
                            "login": "cobrateam",
                            "url": "https://api.github.com/users/cobrateam",
                            "gravatar_id": "1748a027361ab3e3a7f6515ac0319271",
                            "avatar_url": "https://secure.gravatar.com/avatar/1748a027361ab3e3a7f6515ac0319271?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
                            "id": 403905
                          },
                          "name": "splinter",
                          "open_issues": 30,
                          "mirror_url": null,
                          "description": "splinter - python test framework for web applications ",
                          "id": 921367,
                          "watchers": 234,
                          "pushed_at": "2012-03-31T16:30:57Z"
                        }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/cobrateam/members',
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
  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat',
                       :content_type => 'text/json',
                       :body => '{
                          "followers": 145,
                          "following": 0,
                          "type": "User",
                          "login": "octocat",
                          "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                          "public_repos": 3,
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

  FakeWeb.register_uri(:get, 'https://api.github.com/users/',
                       :content_type => 'text/json',
                       :body => '{
                          "message": "Not Found"
                         }')

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/repos',
                       :content_type => 'text/json',
                       :body => '[
                        {
                          "open_issues": 2,
                          "watchers": 875,
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
                          "forks": 130,
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
                          "login": "bernardofire",
                          "url": "https://api.github.com/users/bernardofire",
                          "gravatar_id": "82b341477c74888442fe70db563dac26",
                          "id": 824254
                        }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/following',
                       :content_type => 'text/json',
                       :body => '[{
                          "avatar_url": "https://secure.gravatar.com/avatar/82b341477c74888442fe70db563dac26?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                          "login": "bernardofire",
                          "url": "https://api.github.com/users/bernardofire",
                          "gravatar_id": "82b341477c74888442fe70db563dac26",
                          "id": 824254
                        }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/users/octocat/orgs',
                       :content_type => 'text/json',
                       :body => '[{
                          "avatar_url": "https://secure.gravatar.com/avatar/1748a027361ab3e3a7f6515ac0319271?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
                          "login": "cobrateam",
                          "url": "https://api.github.com/orgs/cobrateam",
                          "id": 403905
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
                          "forks": 2,
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
                          "svn_url": "https://github.com/bernardofire/hello-world",
                          "has_issues": false,
                          "updated_at": "2012-04-02T17:47:49Z",
                          "forks": 0,
                          "html_url": "https://github.com/bernardofire/hello-world",
                          "url": "https://api.github.com/repos/bernardofire/hello-world",
                          "language": null,
                          "fork": true,
                          "clone_url": "https://github.com/bernardofire/hello-world.git",
                          "ssh_url": "git@github.com:bernardofire/hello-world.git",
                          "git_url": "git://github.com/bernardofire/hello-world.git",
                          "has_wiki": true,
                          "mirror_url": null,
                          "size": 168,
                          "private": false,
                          "created_at": "2012-04-02T17:47:49Z",
                          "owner": {
                            "login": "bernardofire",
                            "url": "https://api.github.com/users/bernardofire",
                            "gravatar_id": "a0d10160bff9ca902fcc6da198b01c0e",
                            "id": 1600213,
                            "avatar_url": "https://secure.gravatar.com/avatar/a0d10160bff9ca902fcc6da198b01c0e?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
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
