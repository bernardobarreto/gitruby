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

  def self.find(repository, owner_login)
    new(HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}")
  end

  def forks
    unless @forks
      params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/forks"
      @forks = params.map { |fork| Repo.new(fork) }
    end
    @forks
  end

  def collaborators
    unless @collaborators
      params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/collaborators"
      # TODO: This cause to many requests, better solution?
      @collaborators = params.map { |user| User.find(user['login']) }
    end
    @collaborators
  end

  def collaborator(login)
    if @collaborators
      @collaborators.find { |user| user.login == login }
    else
      User.find(login)
    end
  end

  def issues
    unless @issues
      params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/issues"
      @issues = params.map { |issue| Issue.new(issue) }
    end
    @issues
  end
end
