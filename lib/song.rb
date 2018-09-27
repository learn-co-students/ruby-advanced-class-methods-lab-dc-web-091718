# require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    new_song = self.new
    @@all << new_song

    new_song
  end

  def self.new_by_name(song_name)

    new_song = self.new
    new_song.name = song_name
    new_song

  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if song_name == self.create_by_name(song_name)
      # binding.pry
      self.find_by_name(song_name)
    else
      # binding.pry
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
      self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end


end
