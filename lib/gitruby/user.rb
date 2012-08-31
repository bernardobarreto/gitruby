require 'httparty'
require File.dirname(__FILE__) + '/repo'
require File.dirname(__FILE__) + '/util'

class User
  include Util
  include HTTParty

  base_uri API_URL

  def initialize(params)
    load_lazing_attrs(params)
  end

  def self.find(username)
    new(get "#{API_URL}users/#{username}")
  end

  def orgs(options=nil)
    options = format_options(options)
    params = get "#{API_URL}users/#{@login}/orgs#{options}"
    @orgs = params.map { |org| Org.new(org) }
  end

  def public_repos(options=nil)
    options = format_options(options)
    params = get "#{API_URL}users/#{@login}/repos#{options}"
    params.map { |repo| Repo.new(repo) }
  end

  def followers(options=nil)
    options = format_options(options)
    params = get "#{API_URL}users/#{@login}/followers#{options}"
    params.map { |user| User.new(user) }
  end

  def following(options=nil)
    options = format_options(options)
    params = get "#{API_URL}users/#{@login}/following#{options}"
    params.map { |user| User.new(user) }
  end

  def method_missing(method, *args)
    params = get "#{API_URL}users/#{@login}"
    if params.has_key? method.to_s
      load_lazing_attrs(params)
    else
      super
    end
  end
end
