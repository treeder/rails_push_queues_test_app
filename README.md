# Rails Push Queues Example App

There are really only a couple things here.

1. Add 'rails_push_queues' gem to Gemfile

    gem 'rails_push_queues'

2. Check out app/workers/image_conversion_worker.rb

This is the worker, which is exactly the same as you'd do with Sidekiq or Resque.

3. Check out app/controllers/images_controller.rb

This is where we call the worker to run in the background:

```ruby
ImageConversionWorker.perform_async("somename", "http://urlofimage.com/whatever.jpg")
```

4. Deploy this app and register your workers as subscribers

Push to heroku or something for testing and once you get your apps host name, run this rake command:

```
rake queues:subscribe\[ImageConversionWorker,http://enigmatic-falls-123.herokuapp.com/queues/receive\]
```

5. Kick off a worker!

Browse to: http://enigmatic-falls-123.herokuapp.com/images/convert to queue up a job for the worker.

