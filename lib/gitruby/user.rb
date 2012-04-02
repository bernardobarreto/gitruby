require 'httparty'
require File.dirname(__FILE__) + '/repo'

class User
  BASE_URL = 'https://api.github.com/'

  def initialize(params)
    if params.is_a? String or params.is_a? Symbol
      @login = params
      params = HTTParty.get "#{BASE_URL}users/#{@login}"
    end
    load_lazing_attrs(params)
  end

  def load_lazing_attrs(params=nil)
    params.each do |attr, value|
      unless ['followers', 'following', 'public_repos'].include? attr
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
    unless @orgs
      params = HTTParty.get "#{BASE_URL}users/#{@login}/orgs"
      @orgs = params.map { |org| Org.new(org) }
    end
    @orgs
  end

  def public_repos
    unless @repos
      params = HTTParty.get "#{BASE_URL}users/#{@login}/repos"
      @repos = params.map { |org| Org.new(org) }
    end
    @repos
  end

  def followers
    unless @followers
      params = HTTParty.get "#{BASE_URL}users/#{@login}/followers"
      @followers = params.map { |user| User.new(user) }
    end
    @followers
  end

  def following
    unless @following
      params = HTTParty.get "#{BASE_URL}users/#{@login}/following"
      @following = params.map { |user| User.new(user) }
    end
    @following
  end

  def method_missing(method, *args)
    params = HTTParty.get "#{BASE_URL}users/#{@login}"
    if params.has_key? method.to_s
      load_lazing_attrs(params)
    else
      super
    end
  end
end
