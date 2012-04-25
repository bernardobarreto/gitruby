# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/user'
require File.dirname(__FILE__) + '/util'

class Org
  include Util

  def initialize(params)
    load_lazing_attrs(params)
  end

  def self.find(name)
    new(HTTParty.get "#{BASE_URL}orgs/#{name}")
  end

  def members(options=nil)
    options = format_options(options)
    params = HTTParty.get "#{BASE_URL}orgs/#{@login}/members#{options}"
    params.map { |member| User.find(member['login']) }
  end

  def public_repos(options=nil)
    options = format_options(options)
    params = HTTParty.get "#{BASE_URL}orgs/#{@login}/repos#{options}"
    params.map { |repo| Repo.new(repo) }
  end

  def method_missing(method, *args)
    params = HTTParty.get "#{BASE_URL}orgs/#{@login}"
    if params.has_key? method.to_s
      load_lazing_attrs(params)
    else
      super
    end
  end
end
