# encoding: utf-8
require 'httparty'

class Issue
  BASE_URL = 'https://api.github.com/'

  def initialize(params, owner_login=nil, issue_number=nil)
    if owner_login and issue_number and params.is_a? String or params.is_a? Symbol
      params = HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}/issues/#{issue_number}"
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

  def self.find(repository, owner_login, issue_number)
    new(HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}/issues/#{issue_number}")
  end
end
