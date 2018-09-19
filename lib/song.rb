class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song=Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song=Song.new
    song.name=name
    song
  end
  
  def self.create_by_name(name)
    song=Song.create
    song.name=name
    song
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
    song=find_by_name(name)
    song=create_by_name(name) unless song
    song
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song=new_by_name(filename.split(' - ')[1].split('.')[0])
    puts song.name
    song.artist_name=filename.split(' - ')[0]
    song
  end
  
  def self.create_from_filename(name)
    song=new_from_filename(name)
    @@all << song 
    song
  end
  
  def self.destroy_all
    @@all=[]
  end

end
