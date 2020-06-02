CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      region: ENV['S3_REGION'],
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY']
    }
    config.fog_directory = ENV['S3_BUCKET']
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.asset_host = 'https://s3.amazonaws.com/pealco-image'
    config.fog_public = false
  else
    config.storage :file
  end
end
