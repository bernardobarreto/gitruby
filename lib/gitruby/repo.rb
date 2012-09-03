# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/user'
require File.dirname(__FILE__) + '/issue'
require File.dirname(__FILE__) + '/util'

class Repo
  include Util
  include HTTParty

  base_uri API_URL

  def initialize(params)
    load_lazing_attrs(params)
  end

  def self.find(owner_login, repository)
    new(get "#{API_URL}repos/#{owner_login}/#{repository}")
  end

  def forks(options=nil)
    get_data(options, :forks)
  end

  def collaborators(options=nil)
    get_data(options, :collaborators)
  end

  def issues(options=nil)
    get_data(options, :issues)
  end

  def assignees(options=nil)
    get_data(options, :assignees)
  end

  def issue(number)
    Issue.find(@owner['login'], @name, number)
  end
end
