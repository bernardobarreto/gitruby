# encoding: utf-8
require 'httparty'
require File.dirname(__FILE__) + '/util'

class Issue
  include Util
  include HTTParty

  base_uri API_URL

  def initialize(params)
    load_lazing_attrs(params)
  end

  def self.find(owner_login, repository, issue_number)
    new(get "#{API_URL}repos/#{owner_login}/#{repository}/issues/#{issue_number}")
  end
end
