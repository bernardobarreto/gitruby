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
      if not ['followers', 'following', 'public_repos'].include? attr
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

  def followers
    if not @followers
      params = HTTParty.get "#{BASE_URL}users/#{@login}/followers"
      @followers = []
      params.each do |user|
        @followers << User.new(user)
      end
    end
    return @followers
  end

  def following
    if not @following
      params = HTTParty.get "#{BASE_URL}users/#{@login}/following"
      @following = []
      params.each do |user|
        @following << User.new(user)
      end
    end
    return @following
  end
end
