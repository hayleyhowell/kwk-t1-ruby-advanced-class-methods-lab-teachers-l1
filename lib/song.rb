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
    song = Song.new 
    @@all << song 
    song 
  end 
  
  def self.new_by_name(name)
    song = Song.new 
    song.name=name 
    song 
  end 
  
  def self.create_by_name(name)
    song = Song.new 
    song.name=name 
    @@all << song 
    song 
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song 
      end 
    end
    return nil 
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil 
      return find_by_name(name)
    else 
      create_by_name(name)
    end
  end 
  
  def self.alphabetical 
    sorted = @@all.sort do |a, b|
      if a.name == b.name
        0
      elsif a.name > b.name
        1
      elsif a.name < b.name
        -1
      end
    end 
    sorted 
  end 
  
  def self.new_from_filename(name)
    cut = name.chomp(".mp3")
    splitted = cut.split(" - ")
    song = Song.new 
    song.name = splitted[1]
    song.artist_name = splitted[0]
    song 
  end 
end
