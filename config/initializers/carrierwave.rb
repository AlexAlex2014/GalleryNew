CarrierWave.configure do |config|
  # if Rails.env.production?
  #   config.storage = :fog
  # end
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id:  Rails.application.credentials.access_key_id,
      aws_secret_access_key: Rails.application.credentials.secret_access_key,
      # use_iam_profile:       true,                         # optional, defaults to false
      region: Rails.application.credentials.region,
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'gentle-ridge-18466'
  # config.fog_public     = false                                                 # optional, defaults to true
  # config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
