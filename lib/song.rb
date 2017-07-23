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
  song.save
  song
  end

def self.new_by_name (name)
  song = Song.new
  song.name = name
  song
end
# #   Build a class constructor Song.new_by_name
# that takes in the string name of a song and returns
# a song instance with that name set as its name property.
#  Song.new_by_name should return an instance of Song and
#   not a simple string or anything else. Implement the
#   following functionality:
# song = Song.new_by_name("The Middle")
# #=> #<Song @name="The Middle">
# song.name #=> "The Middle"

def self.create_by_name(name)
song = Song.new
  song.name = name
  song.save
  song
end

def self.find_by_name(name)
  @@all.find {|song| song.name ==name}
end
# Build a class constructor Song.create_by_name
# that takes in the string name of a song and
# returns a song instance with that name set as its
# name property and the song being saved into the
 # @@all class variable.

   def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end


def self.alphabetical
  @@all.sort_by { |song| song.name }
end

     def self.destroy_all
        self.all.clear
      end

        def self.new_from_filename(song)
         artist_and_song = song.gsub(".mp3","").split(" - ")
         song = self.new_by_name(artist_and_song[1])
         song.artist_name = artist_and_song[0]
         song
       end


      def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
        song
      end

    end

# Build a class constructor Song.create
#that initializes a song and saves it to the
# @@all class variable either literally or through
# the class method Song.all. This method should
# return the song instance that was initialized and saved.
# Consider:
# song = Song.create
# Song.all.include?(song) #=> true
