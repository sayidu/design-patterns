class YoutubeChannel
  attr_reader :videos, :subscribers

  def initialize
    @videos = []
    @subscribers = []
  end

  def add_subscriber(new_subscriber)
    subscribers << new_subscriber
  end

  def remove_subscriber(subscriber)
    subscribers.delete(subscriber)
  end

  def add_video(new_video)
    videos << new_video
    subscribers.each(&:notify_me)
  end
end

class Subscriber
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def notify_me
    puts "#{name}: Notified"
  end
end

# [Run]
youtube_channel = YoutubeChannel.new
subscriber = Subscriber.new('Tom Danny')
youtube_channel.add_subscriber(subscriber)
youtube_channel.add_video('The Wendy Show')
