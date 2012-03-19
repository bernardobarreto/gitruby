# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/user'

class Repo
  BASE_URL = 'https://api.github.com/'

  def initialize(params, owner_login=nil)
    if owner_login and params.is_a? String or params.is_a? Symbol
      params = HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{params}"
    end
    params.each do |attr, value|
      if not attr == 'forks'
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

  def forks
    if not @forks
      params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/forks"
      @forks = []
      params.each do |fork|
        @forks << Repo.new(fork)
      end
    end
    return @forks
  end

  def collaborators
    if not @collaborators
      params = HTTParty.get "#{BASE_URL}repos/#{@owner['login']}/#{@name}/collaborators"
      @collaborators = []
      params.each do |collaborator|
        # TODO: This cause to many requests, better solution ?
        @collaborators << User.find(collaborator['login'])
      end
    end
    return @collaborators
  end

  def collaborator(login)
    if @collaborators
      @collaborators.each do |user|
        if user.login == login
          return user
        end
      end
    else
      return User.find(login)
    end
  end

  def self.find(repository, owner_login)
    new(HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}")
  end
end
