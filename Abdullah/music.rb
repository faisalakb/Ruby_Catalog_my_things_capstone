# Define the music class
# frozen_string_literal: true

require 'date'
require_relative '../items'

class MusicAlbum
  attr_accessor :id, :name, :genre, :singer, :on_spotify

  def initialize(id, name, genre, singer, on_spotify)
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
end
