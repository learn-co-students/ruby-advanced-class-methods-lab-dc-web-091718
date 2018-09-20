require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = new_by_name(song_name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
    self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(file_name)
    file_name = file_name.split(/[-.]/)
    artist = file_name[0]
    artist = artist.strip
    song_name = file_name[1]
    song_name = song_name.strip
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
