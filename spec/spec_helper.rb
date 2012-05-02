require "require_all"
require 'fakeweb'
require 'rspec'
require 'gitruby'

require_all File.expand_path(__FILE__ + "/../../lib")
require_all File.expand_path(__FILE__ + "/../fakeweb")

FakeWeb.allow_net_connect = false

FakeWeb.register_uri(
  :get, %r|https://api\.github\.com*|,
  :content_type => 'text/json',
  :body => '{
   "message": "Not Found"
  }')
