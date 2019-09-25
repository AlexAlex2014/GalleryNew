if Rails.env.development?
  uri = URI.parse("redis://localhost:6379/")
else
  uri = URI.parse(ENV['REDIS_URL'])
end
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
