# Two song formats:
# ["Thriller", "Like a Prayer"], { "1": "Survivor", "2": "Just Dance" }

# Internal Iterator
class SongsCollection
  def initialize(songs, numbered_songs)
    @songs = songs
    @numbered_songs = numbered_songs
  end

  def order_songs
    @songs.each do |song|
      puts 'Songs List'
      puts song
    end

    @numbered_songs.each do |_song_no, song|
      puts 'Numbered  Songs List'
      puts song
    end
  end
end

# External Iterator: Iterator Pattern Implemented
class SongsArrayIterator
  attr_reader :songs
  attr_accessor :current_index

  def initialize(songs)
    @songs = songs
    @current_index = 0
  end

  def has_next?
    current_index < songs.length
  end

  def next
    raise 'No more songs left.' unless has_next?

    song = songs[current_index]
    self.current_index += 1
    song
  end
end

class SongsHashIterator
  attr_reader :collection, :keys
  attr_accessor :current_index

  def initialize(songs)
    @songs = songs
    @keys = songs.keys
    @current_index = 0
  end

  def has_next?
    current_index < keys.length
  end

  def next
    raise 'No more songs left.' unless has_next?

    song = @songs[keys[current_index]]
    self.current_index += 1
    song
  end
end

class SongsCollection
  attr_reader :song_iterators
  attr_accessor :all_songs

  def initialize(song_iterators)
    @song_iterators = song_iterators
    @all_songs = get_all_songs
  end

  private

  def get_all_songs
    songs = []

    song_iterators.each do |song_iterator|
      songs << song_iterator.next while song_iterator.has_next?
    end

    songs
  end
end

# [Run]
array_songs = ['Thriller', 'Like a Prayer']
hash_songs = { "1": 'Survivor', "2": 'Just Dance' }
array_iterator = SongsArrayIterator.new(array_songs)
hash_iterator =  SongsHashIterator.new(hash_songs)
song_iterators = [array_iterator, hash_iterator]
songs_collection = SongsCollection.new(song_iterators)
puts songs_collection.all_songs
