if Rails.env.development?
  uri = URI.parse("redis://localhost:6379/")
  Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  # ENV['REDISTOGO_URL'] = 'redis://h:p1ebc00fd1211ae2a744a0ec54b792ae7f8764fd4d0aae75bb9cad1d0ef80b992@ec2-3-221-70-198.compute-1.amazonaws.com:15069'
  uri = URI.parse(ENV['REDISTOGO_URL'])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  Resque.redis = REDIS
  # Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
end
Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
