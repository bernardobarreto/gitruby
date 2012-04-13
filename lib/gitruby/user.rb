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
      @repos = params.map { |repo| Repo.new(repo) }
    end
    @repos
  end

  def followers(options=nil)
    options = format_options(options) || ''
    params = HTTParty.get "#{BASE_URL}users/#{@login}/followers#{options}"
    return params.map { |user| User.new(user) }
  end

  def following(options=nil)
    options = format_options(options) || ''
    params = HTTParty.get "#{BASE_URL}users/#{@login}/following#{options}"
    return params.map { |user| User.new(user) }
  end

  def format_options(options=nil)
    options = '?' + options.map {|k, v| "%s=%s" % [k, v] }.join("&") if options
    return options
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
