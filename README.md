# Dragonfly S3 Server

Isolate [Dragonfly](https://github.com/markevans/dragonfly) processing and serving of [S3 assets](https://github.com/markevans/dragonfly-s3_data_store) from your main app.

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/benpickles/dragonfly-s3-server)

## Configuration

`AWS_ACCESS_KEY_ID`: Your AWS Access Key ID.

`AWS_REGION`: The AWS region in which the S3 bucket resides.

`AWS_SECRET_ACCESS_KEY`: Your AWS Secret Access Key.

`DRAGONFLY_SECRET`: The Dragonfly secret key that protects against DOS attacks - shared with the main app.

`S3_BUCKET`: The name of your S3 bucket.

## Modifications to the main Rails app

There are a couple of changes to make in your main Rails app's `config/initializers/dragonfly.rb`.

Ensure that Dragonfly-generated asset URLs point to your newly created server by adding a `url_host`:

```ruby
Dragonfly.app.configure do
  url_host 'https://my-dragonfly-s3-server.example.com'
end
```

Prevent assets from being processed/served by **removing this line**:

```ruby
Rails.application.middleware.use Dragonfly::Middleware
```

## Licence

Copyright © [Ben Pickles](http://www.benpickles.com), [MIT licence](LICENCE).
