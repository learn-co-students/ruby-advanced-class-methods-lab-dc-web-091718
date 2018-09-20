class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.create
  		song = Song.new
  		song.save
  		song
  end 

  def self.new_by_name(string)
  		song = Song.new
  		song.name = string   		
  		song

  end

  def self.create_by_name(string)
  		song = Song.new
  		song.name = string  
  		song.save 		
  		song
  end

  def self.find_by_name(name)

  	@@all.each do |element|
  		if element.name == name
  			return element
  		end
  	end 
  	return nil
  end

  def self.find_or_create_by_name(string)
	 
  	 song  = Song.find_by_name(string) 
  	  if (!song)
  	  		new_song = Song.create_by_name(string)
  	  		bool_new_song = true
  	  end
  	  bool_new_song ? new_song : song
  end

  def self.alphabetical	
  		@@all.sort_by {|word| word.name}
  end

  def self.new_from_filename(filename)
  		arr = filename.split(" - ")
  		song = Song.new
  		song.artist_name = arr[0]
  		song.name = arr[1][0..-5]
  		song
  end

  def self.create_from_filename(filename)
	arr = filename.split(" - ")
	  		song = Song.new
	  		song.artist_name = arr[0]
	  		song.name = arr[1][0..-5]
	  		song.save
	  		song
  end


   def self.destroy_all
   
   	@@all.clear

   end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
