require('pry')

class Album
  attr_reader :id
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def self.all()
    @@albums.values()

  end

  def self.find(name)
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  # def self.search(name)
  #   @@albums[]
  # end

  def self.find(id)
    @@albums[id]
  end

  def self.search(name)
    #code from a classmate as another solution-------------
    # @@albums.select do |id, album|
    #   album.name == name
    # end
    #----------------------------------------------------
    x = 1
    found_albums = []
    while (x <= @@albums.keys.length)
      if @@albums[x].name == name
        found_albums.push (@@albums[x])
      end
      x += 1
    end
    found_albums
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.sort
    sorted_albums = @@albums.sort_by { |id, album| album.name.downcase }
    @@albums = sorted_albums.to_h
  end
end
