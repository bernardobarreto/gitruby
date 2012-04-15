# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/user'
require File.dirname(__FILE__) + '/issue'

class Repo
  BASE_URL = 'https://api.github.com/'

  def initialize(params, owner_login = nil)
    if owner_login and params.is_a? String or params.is_a? Symbol
      params = HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{params}"
    end
    params.each do |attr, value|
      unless attr == 'forks'
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

  def self.find(owner_login, repository)
    new(HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}")
  end

  def forks(options=nil)
    options = format_options(options)
    params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/forks#{options}"
    return params.map { |fork| Repo.new(fork) }
  end

  def collaborators(options=nil)
    options = format_options(options)
    params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/collaborators#{options}"
    return params.map { |user| User.new(user) }
  end

  def collaborator(login)
    return User.find(login)
  end

  def issues
    unless @issues
      params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/issues"
      @issues = params.map { |issue| Issue.new(issue) }
    end
    @issues
  end

  private

  def format_options(options=nil)
    options = '?' + options.map {|k, v| "%s=%s" % [k, v] }.join("&") if options
    return options || ''
  end
end
