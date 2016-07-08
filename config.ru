require 'dragonfly'
require 'dragonfly/s3_data_store'

Dragonfly.app.configure do
  plugin :imagemagick

  verify_urls true
  secret ENV.fetch('DRAGONFLY_SECRET')

  url_format ENV.fetch('DRAGONFLY_URL_FORMAT')

  datastore :s3,
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    bucket_name: ENV.fetch('S3_BUCKET'),
    region: ENV.fetch('AWS_REGION'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
end

Dragonfly.logger = Logger.new($stdout)

run Dragonfly.app
