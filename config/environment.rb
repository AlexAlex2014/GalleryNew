# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

app_vars = File.join(Rails.root, 'config', 'initializers', 'app_vars.rb')
load(app_vars) if File.exists?(app_vars)
