CarrierWave.configure do |config|
  # 本番環境の場合はS3へアップロード
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS', # required
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'], # required unless using use_iam_profile
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # required unless using use_iam_profile
      # use_iam_profile: true, # optional, defaults to false
      region: ENV['S3_REGION'], # optional, defaults to 'us-east-1'
      # host: 's3.example.com', # optional, defaults to nil
      # endpoint: 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = ENV['S3_BUCKET_NAME'] # required
    config.fog_public = false # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}

    # Use this if you have AWS S3 ACLs disabled.
    # config.fog_attributes = { 'x-amz-acl' => 'bucket-owner-full-control' }
    # Use this if you have Google Cloud Storage uniform bucket-level access enabled.
    # config.fog_attributes = { uniform: true }
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
    # config.cache_storage = :file

  # 本番環境以外の場合はアプリケーション内にアップロード
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
