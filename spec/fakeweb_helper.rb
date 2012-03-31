module FakeWebHelper
  require 'fakeweb'
  FakeWeb.allow_net_connect = true

  # Fake for Issue
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

  # Fake for Organization
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
end
