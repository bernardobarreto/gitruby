# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/user'

class Org
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
      unless ['public_repos'].include? attr
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

  def self.find(name)
    new(HTTParty.get "#{BASE_URL}orgs/#{name}")
  end

  def members
    params = HTTParty.get "#{BASE_URL}orgs/#{@login}/members"
    return params.map { |member| User.find(member['login']) }
  end

  def public_repos
    params = HTTParty.get "#{BASE_URL}orgs/#{@login}/repos"
    return params.map { |repo| Repo.new(repo) }
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
