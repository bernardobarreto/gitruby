# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/user'
require File.dirname(__FILE__) + '/util'

class Org
  include Util
  include HTTParty

  def initialize(params)
    load_lazing_attrs(params)
  end

  def self.find(name)
    new(get "#{API_URL}orgs/#{name}")
  end

  def members(options=nil)
    get_data(options, :members)
  end

  def public_repos(options=nil)
    get_data(options, :repos)
  end

  def get_data(options, name)
    options = format_options(options)
    types = { members: User, repos: Repo }
    params = get "#{API_URL}orgs/#{@login}/#{name}#{options}"
    params.map { |x| types[name].new(x) }
  end

  def method_missing(method, *args)
    params = get "#{API_URL}orgs/#{@login}"
    if params.has_key? method.to_s
      load_lazing_attrs(params)
    else
      super
    end
  end
end
