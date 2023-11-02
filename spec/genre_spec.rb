require_relative '../Abdullah/genre'

describe Genre do
  let(:sample_genre) { Genre.new(1, 'Action') }

  describe '#initialize' do
    it 'sets the id and name correctly' do
      expect(sample_genre.id).to be_an(Integer)
      expect(sample_genre.name).to eq('Action')
    end

    it 'initializes an empty items array' do
      expect(sample_genre.items).to be_an(Array)
      expect(sample_genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      item = double('item', set_genre: nil)  # Use a test double with set_genre method
      sample_genre.add_item(item)
      expect(sample_genre.items).to include(item)
    end

    it 'sets the genre of the added item to self' do
      item = double('item', set_genre: nil)  # Use a test double with set_genre method
      expect(item).to receive(:set_genre).with(sample_genre)
      sample_genre.add_item(item)
    end
  end
end
