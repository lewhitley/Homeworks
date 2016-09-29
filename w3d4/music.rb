# app/models/track.rb
class Track
   belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )
end


# app/models/album.rb
class Album
  belongs_to(
    :artist,
    class_name: "Artist",
    foreign_key: :artist_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )
end


# app/models/artist.rb
class Artist
  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :artist_id,
    primary_key: :id
  )

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end
  #returns the number of tracks on each album by the artist

  has_many :tracks,
    through: :albums,
    source: :tracks

  def better_tracks_query
    albums_with_count = self
      .albums
      .select("albums.*, COUNT(*) AS track_count")
      .joins(:tracks)
      .group("albums.id")

    albums_with_count.map do |album|
      [album.title, album.track_count]
    end
  end
end
