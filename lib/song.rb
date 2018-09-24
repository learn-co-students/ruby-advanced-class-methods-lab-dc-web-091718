require 'pry'
class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
     song = Song.new
     self.all << song
     song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.each do |instance|
      if instance.name == name
        return instance
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name)

      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    # sort_array = []
    # self.all.each do |instance|
    #   sort_array << instance.name
    #
    #   sort_array = sort_array.sort
    self.all.sort_by{|obj| obj.name}
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
