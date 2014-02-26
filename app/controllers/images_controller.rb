class ImagesController < ApplicationController

  def convert
    # Queues up a job to work
    ImageConversionWorker.perform_async("somename", "http://urlofimage.com/whatever.jpg")
    render :text => "Woot woot"
  end

end
