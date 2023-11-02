# Define the music class

require 'date'
require_relative '../items'

class MusicAlbum
  attr_accessor :id, :name, :genre, :singer, :on_spotify, :publish_date

  def initialize(id, name, genre, singer, on_spotify)
    @id = id
    @name = name
    @genre = genre
    @singer = singer
    @on_spotify = !!on_spotify
    @publish_date = Date.today
  end

  def can_be_archived?
    age_in_years = (Date.today - @publish_date).to_i / 365
    age_in_years > 10 && @on_spotify
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
