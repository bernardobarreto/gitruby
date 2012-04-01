module FakeWebHelper
  require 'fakeweb'
  FakeWeb.allow_net_connect = true

  ################################## Fake for Issue ###############################
  FakeWeb.register_uri(:get, 'https://api.github.com/repos/guilhermeportoes/janelas/issues/1',
                       :content_type => 'text/json',
                       :body => '{
                          "closed_by": null,
                          "updated_at": "2012-03-18T21:48:23Z",
                          "comments": 1,
                          "state": "open",
                          "assignee": null,
                          "url": "https://api.github.com/repos/guilhermeportoes/janelas/issues/1",
                          "user": {
                            "url": "https://api.github.com/users/firetest",
                            "gravatar_id": "1b91afd28bd4383be5e460b7a6c8c5ea",
                            "avatar_url": "https://secure.gravatar.com/avatar/1b91afd28bd4383be5e460b7a6c8c5ea?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
                              "id": 1538901,
                            "login": "firetest"
                          },
                          "title": "this is a issue",
                          "html_url": "https://github.com/guilhermeportoes/janelas/issues/1",
                          "created_at": "2012-03-18T21:41:31Z",
                          "milestone": null,
                          "labels": [

                          ],
                          "number": 1,
                          "body": "this is the issue comment",
                          "closed_at": null,
                          "id": 3702748,
                          "pull_request": {
                            "patch_url": null,
                            "diff_url": null,
                            "html_url": null
                          }
                        }')

  ################################## Fake for Organization ###############################
  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/ShadowLinux',
                       :content_type => 'text/json',
                       :body => '{
                            "type": "Organization",
                            "url": "https://api.github.com/orgs/ShadowLinux",
                            "public_repos": 3,
                            "html_url": "https://github.com/ShadowLinux",
                            "created_at": "2011-07-01T17:57:43Z",
                            "public_gists": 0,
                            "avatar_url": "https://secure.gravatar.com/avatar/58097cc1310f31f3dc95c20386204ed8?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
                            "followers": 0,
                            "following": 0,
                            "id": 889190,
                            "login": "ShadowLinux"
                          }')

  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/ShadowLinux/repos',
                       :content_type => 'text/json',
                       :body => '[
                          {
                            "clone_url": "https://github.com/ShadowLinux/ShadowLinux.git",
                            "url": "https://api.github.com/repos/ShadowLinux/ShadowLinux",
                            "mirror_url": null,
                            "has_wiki": true,
                            "ssh_url": "git@github.com:ShadowLinux/ShadowLinux.git",
                            "git_url": "git://github.com/ShadowLinux/ShadowLinux.git",
                            "owner": {
                              "url": "https://api.github.com/users/ShadowLinux",
                              "gravatar_id": "58097cc1310f31f3dc95c20386204ed8",
                              "login": "ShadowLinux",
                              "id": 889190,
                              "avatar_url": "https://secure.gravatar.com/avatar/58097cc1310f31f3dc95c20386204ed8?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png"
                            },
                            "open_issues": 0,
                            "description": "A linux distribution created from scratch",
                            "watchers": 1,
                            "pushed_at": null,
                            "updated_at": "2011-10-04T16:32:38Z",
                            "size": 0,
                            "fork": false,
                            "html_url": "https://github.com/ShadowLinux/ShadowLinux",
                            "has_downloads": true,
                            "homepage": "",
                            "svn_url": "https://github.com/ShadowLinux/ShadowLinux",
                            "name": "ShadowLinux",
                            "has_issues": true,
                            "private": false,
                            "created_at": "2011-07-01T18:00:08Z",
                            "id": 1984628,
                            "forks": 1,
                            "language": null
                          }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/ShadowLinux/members',
                       :content_type => 'text/json',
                       :body => '[{
                            "url": "https://api.github.com/users/octocat",
                            "gravatar_id": "7ad39074b0584bc555d0417ae3e7d974",
                            "login": "octocat",
                            "id": 583231,
                            "avatar_url": "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
                          }]')

  FakeWeb.register_uri(:get, 'https://api.github.com/orgs/',
                       :content_type => 'text/json',
                       :body => '{
                          "message": "Not Found"
                        }')

  ################################## Fake for Users ###############################
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
end
