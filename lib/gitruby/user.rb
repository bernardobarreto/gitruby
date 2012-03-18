require 'httparty'
require File.dirname(__FILE__) + '/repo'

class User
  BASE_URL = 'https://api.github.com/'

  def initialize(params)
    if params.is_a? String or params.is_a? Symbol
      params = HTTParty.get "#{BASE_URL}users/#{params}"
      @login = params
    end
    params.each do |attr, value|
      if !!value == value
        self.singleton_class.send(:attr_writer, attr)
        self.singleton_class.send(:define_method, "#{attr}?") do
          instance_variable_get("@#{attr}")
        end
      else
        self.singleton_class.send(:attr_accessor, attr)
      end
      send("#{attr}=", value)
    end
    begin
      self.singleton_class.send(:remove_method, :public_repos); rescue
    end
  end

  def self.find(username)
    new(HTTParty.get "#{BASE_URL}users/#{username}")
  end

  def orgs
    if not @orgs
      params = HTTParty.get "#{BASE_URL}users/#{@login}/orgs"
      @orgs = []
      params.each do |org|
        @orgs << Org.new(org)
      end
    end
    return @orgs
  end

  def public_repos
    if not @repos
      params = HTTParty.get "#{BASE_URL}users/#{@login}/repos"
      @repos = []
      params.each do |repo|
        @repos << Repo.new(repo)
      end
    end
    return @repos
  end
end
