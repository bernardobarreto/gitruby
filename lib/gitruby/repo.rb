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
  self.singleton_class.send(:define_method, :collaborators) do
    collaborators
  end

  def self.find(repository, owner_login)
    new(HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}")
  end
end
