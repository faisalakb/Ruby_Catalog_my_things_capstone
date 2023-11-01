# Define the music class
# frozen_string_literal: true

require 'date'
require_relative '../items'

class MusicAlbum
  attr_accessor :on_spotify

  def initialize(on_spotify)
    @on_spotify = !!on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
