require 'rspec'
require_relative '../Abdullah/music'

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when album is on Spotify' do
      it 'returns true' do
        album = MusicAlbum.new(1, 'Album Name', 'Genre', 'Singer', '12-12-2020', true)
        expect(album.can_be_archived?).to be_truthy
      end
    end

    context 'when album is not on Spotify' do
      it 'returns false' do
        album = MusicAlbum.new(1, 'Album Name', 'Genre', 'Singer', '12/12/2020', false)
        expect(album.can_be_archived?).to be_falsy
      end
    end
  end
end
