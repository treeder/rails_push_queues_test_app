class ImageConversionWorker

  # sidekiq style include to add perform_async and delay methods.
  include Sidekiq::Worker

  def perform(name, url)
    # convert some kind of image here
    puts "#{self.class.name} is about to process #{name} at #{url}"
  end
end

