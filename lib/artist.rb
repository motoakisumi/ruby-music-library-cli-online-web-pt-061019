class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    song = Artist.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include? song
  end

  def genres
    test_array = []
    @songs.each do |song|
      if test_array.include?(song.genre)
        nil
      else
        test_array << song.genre
      end
    end
    test_array
  end


end
