if Rails.env.development?
  uri = URI.parse("redis://localhost:6379/")
  Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
else
  uri = URI.parse(ENV['REDISTOGO_URL'])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  Resque.redis = REDIS
  Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
end

# uri = URI.parse("redis://localhost:6379/")
# Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }


# uri = URI.parse("redis://localhost:6379/")
# Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :path=>nil, :password=>nil, :db=>0, :driver=>Redis::Connection::Ruby)