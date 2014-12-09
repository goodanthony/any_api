require 'rubygems'
require "minitest/autorun"
require 'net/http'
require 'uri'
require 'json'
require 'yaml'


libpath = File.dirname(__FILE__)
$LOAD_PATH.unshift File.join(libpath, "..", "lib")

require_relative "../lib/any_api"

secretfile = YAML.load_file("#{Dir.pwd}/test/fixtures/secrets.yml")

AnyApi.configure do |config|
  config.api_base_url =  secretfile["conf"]["api_base_url"]
  config.username =  secretfile["conf"]["username"]
  config.password =  secretfile["conf"]["password"]
end
