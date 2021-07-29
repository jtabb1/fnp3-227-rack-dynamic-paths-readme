class Song

  attr_accessor :title, :artist

  def initialize(title, artist)
    @title = title
    @artist = artist
  end

end

class Application

  @@songs = [Song.new("Sorry", "Justin Bieber"),
            Song.new("Hello","Adele")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/songs/)

      puts req.path                               # for testing only
      puts req.path.split("/songs/").inspect      # for testing only

      song_title = req.path.split("/songs/").last #strip path info to capture just the title
      song = @@songs.find{|s| s.title == song_title}

      resp.write song.artist
    end

    resp.finish
  end
end
