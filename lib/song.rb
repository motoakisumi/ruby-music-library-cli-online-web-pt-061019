class Song

  attr_accessor :name
  @@all = []

  def initialize(name, artist=nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result != nil
      result
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    a = filename.split(" - ")[0]
    g = filename.split(" - ")[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)

    Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|song| song.save }
  end
end
