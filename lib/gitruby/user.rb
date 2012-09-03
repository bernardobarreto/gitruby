require 'httparty'
require File.dirname(__FILE__) + '/repo'
require File.dirname(__FILE__) + '/util'

class User
  include Util
  include HTTParty

  def initialize(params)
    load_lazing_attrs(params)
  end

  def self.find(username)
    new(get "#{API_URL}users/#{username}")
  end

  def orgs(options=nil)
    get_data(options, :orgs)
  end

  def public_repos(options=nil)
    get_data(options, :repos)
  end

  def followers(options=nil)
    get_data(options, :followers)
  end

  def following(options=nil)
    get_data(options, :following)
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
