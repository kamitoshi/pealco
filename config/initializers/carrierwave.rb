CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['S3_SECRET_KEY'],
    region: ENV['S3_REGION']
    }
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'pealco-image'
    config.asset_host = 'https://pealco-image.s3-ap-northeast-1.amazonaws.com'
    config.fog_public = true
  else
    config.storage = :file
  end
end

