require 'date'
require_relative '../items'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super() # this will call any parent method so we can use it here

    @on_spotify = !!on_spotify
  end

  def can_be_archived?
    super && @on_spotify # super call the parent similar method and check if onspotify is true
  end
end
