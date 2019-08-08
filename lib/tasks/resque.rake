require 'resque/tasks'

task "resque:setup" => :environment # do
#   require 'resque'
#
#   ENV['QUEUE'] = '*'
#   ENV['TERM_CHILD'] = '1'
#   ENV['RESQUE_TERM_TIMEOUT'] = '10'
#
#   Resque.redis = 'localhost:6379' unless Rails.env == 'production'
#   ENV['QUEUES'] = 'default,sleep,wake_up,run'
#
# end
#
# Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
#
# desc "Alias for resque:work (To run workers on Heroku)"
# task "jobs:work" => "resque:work"