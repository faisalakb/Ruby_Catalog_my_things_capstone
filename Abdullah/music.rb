# Define the music class

require 'date'
require_relative '../items'

class MusicAlbum < Item
  attr_accessor :name, :genre, :singer, :publish_date, :on_spotify

  def initialize(id, name, genre, singer, publish_date, on_spotify)
    super(id, genre, nil, nil, publish_date, false)
    @name = name
    @genre = genre
    @singer = singer
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if on_spotify

    false
  end

  def to_h
    {
      'id' => id,
      'name' => name,
      'genre' => genre,
      'singer' => singer,
      'published date' => publish_date,
      'on spotify' => on_spotify
    }
  end

  def self.load_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      albums_data = JSON.parse(json_data)
      albums_data.map do |data|
        MusicAlbum.new(data['id'], data['name'], data['genre'], data['singer'], data['published date'],
                       data['on spotify'])
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
