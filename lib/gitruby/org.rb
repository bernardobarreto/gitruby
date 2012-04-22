# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/user'
require File.dirname(__FILE__) + '/util'

class Org
  BASE_URL = 'https://api.github.com/'

  def initialize(params)
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

  def members(options=nil)
    options = format_options(options)
    params = HTTParty.get "#{BASE_URL}orgs/#{@login}/members#{options}"
    return params.map { |member| User.find(member['login']) }
  end

  def public_repos(options=nil)
    options = format_options(options)
    params = HTTParty.get "#{BASE_URL}orgs/#{@login}/repos#{options}"
    return params.map { |repo| Repo.new(repo) }
  end

  private

  def format_options(options=nil)
    options = '?' + options.map {|k, v| "%s=%s" % [k, v] }.join("&") if options
    return options || ''
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
