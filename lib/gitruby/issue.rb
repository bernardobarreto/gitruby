# encoding: utf-8
require 'httparty'

class Issue
  BASE_URL = 'https://api.github.com/'

  def initialize(params)
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

  def self.find(owner_login, repository, issue_number)
    new(HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}/issues/#{issue_number}")
  end
end
