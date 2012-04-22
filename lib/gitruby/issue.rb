# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/util'

class Issue
  include Util

  def initialize(params)
    load_lazing_attrs(params)
  end

  def self.find(owner_login, repository, issue_number)
    new(HTTParty.get "#{BASE_URL}repos/#{owner_login}/#{repository}/issues/#{issue_number}")
  end
end
