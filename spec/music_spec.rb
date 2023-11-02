require 'rspec'
require_relative '../Abdullah/music'

# RSpec.describe MusicAlbum do
#   describe '#can_be_archived?' do
#     context 'when album is archived and on Spotify' do
#       it 'returns true' do
#         album = MusicAlbum.new(true)
#         allow(album).to receive(:archived?).and_return(true)
#         expect(album.can_be_archived?).to be_truthy
#       end
#     end

#     context 'when album is not archived' do
#       it 'returns false' do
#         album = MusicAlbum.new(true)
#         allow(album).to receive(:archived?).and_return(false)
#         expect(album.can_be_archived?).to be_falsy
#       end
#     end

#     context 'when album is not on Spotify' do
#       it 'returns false' do
#         album = MusicAlbum.new(false)
#         allow(album).to receive(:archived?).and_return(true)
#         expect(album.can_be_archived?).to be_falsy
#       end
#     end
#   end
# end

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when album is on Spotify' do
      it 'returns true' do
        album = MusicAlbum.new(1, 'Album Name', 'Genre', 'Singer', '12/12/2020', true)
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

  describe '#to_h' do
    it 'returns a hash representation of the album' do
      album = MusicAlbum.new(1, 'Album Name', 'Genre', 'Singer', '12/12/2020', true)
      expected_hash = {
        'id' => album.id,
        'name' => 'Album Name',
        'genre' => 'Genre',
        'singer' => 'Singer',
        'published date' => '12/12/2020',
        'on spotify' => true
      }
      expect(album.to_h).to eq(expected_hash)
    end
  end

  describe '.load_from_json' do
    context 'when the JSON file exists' do
      it 'loads the albums from the JSON file' do
        filename = 'albums.json'
        json_data = '[{"id": 1, "name": "Album 1", "genre": "Genre 1", "singer": "Singer 1","publish_date":"12/12/2020", "on spotify": true}, {"id": 2, "name": "Album 2", "genre": "Genre 2", "singer": "Singer 2","publish_date":"12/12/2021", "on spotify": true}]'
        allow(File).to receive(:exist?).with(filename).and_return(true)
        allow(File).to receive(:read).with(filename).and_return(json_data)

        albums = MusicAlbum.load_from_json(filename)

        expect(albums).to be_an(Array)
        expect(albums.size).to eq(2)
        expect(albums[0].id).to eq(1)
        expect(albums[0].name).to eq('Album 1')
        expect(albums[0].genre).to eq('Genre 1')
        expect(albums[0].singer).to eq('Singer 1')
        expect(albums[0].publish_date).to eq('12/12/2020')
        expect(albums[0].on_spotify).to be_truthy
        expect(albums[1].id).to eq(2)
        expect(albums[1].name).to eq('Album 2')
        expect(albums[1].genre).to eq('Genre 2')
        expect(albums[1].singer).to eq('Singer 2')
        expect(albums[0].publish_date).to eq('12/12/2021')
        expect(albums[1].on_spotify).to be_falsy
      end
    end

    context 'when the JSON file does not exist' do
      it 'returns an empty array' do
        filename = 'nonexistent.json'
        allow(File).to receive(:exist?).with(filename).and_return(false)

        albums = MusicAlbum.load_from_json(filename)

        expect(albums).to be_an(Array)
        expect(albums).to be_empty
      end
    end
  end

  describe '.save_to_json' do
    it 'saves the albums to a JSON file' do
      albums = [
        MusicAlbum.new(1, 'Album Name', 'Genre', 'Singer', '12/12/2020', true),
        MusicAlbum.new(2, 'Album Name', 'Genre', 'Singer', '12/12/2020', false)
      ]
      filename = 'albums.json'
      expected_json_data = '[{"id": 1, "name": "Album 1", "genre": "Genre 1", "singer": "Singer 1","publish_date":"12/12/2020", "on spotify": true}, {"id": 2, "name": "Album 2", "genre": "Genre 2", "singer": "Singer 2","publish_date":"12/12/2021", "on spotify": false}]'

      allow(File).to receive(:open).with(filename, 'w').and_yield(file = double)
      expect(file).to receive(:write).with(expected_json_data)

      MusicAlbum.save_to_json(albums, filename)
    end
  end
end
