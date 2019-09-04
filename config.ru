# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'resque/server'

run Rails.application
# run Rack::URLMap.new "/" => AppGallery::Application,  "/resque" => Resque::Server.new

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::Static, :urls => ['/carrierwave'], :root => 'tmp' # adding this line
run YourApplicationName::Application
