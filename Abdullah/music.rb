# Define the music class

require 'date'
require_relative '../items'

class MusicAlbum
  attr_accessor :id, :name, :genre, :singer, :on_spotify

  def initialize(_id, name, genre, singer, on_spotify)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @genre = genre
    @singer = singer
    @on_spotify = !!on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_h
    {
      'id' => id,
      'name' => name,
      'genre' => genre,
      'singer' => singer,
      'on spotify' => on_spotify
    }
  end

  def self.load_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      albums_data = JSON.parse(json_data)
      albums_data.map do |data|
        MusicAlbum.new(data['id'], data['name'], data['genre'], data['singer'], data['on spotify'])
      end
    else
      []
    end
  end

  def self.save_to_json(albums, filename)
    File.open(filename, 'w') do |file|
      data = albums.map(&:to_h)
      file.write(JSON.generate(data))
    end
  end
end
