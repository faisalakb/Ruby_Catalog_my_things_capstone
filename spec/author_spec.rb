require_relative '../Abdullah/author'

describe Author do
  let(:sample_author) { Author.new(1, 'John', 'Doe') }

  describe '#initialize' do
    it 'sets the id, first name, and last name correctly' do
      expect(sample_author.id).to eq(1)
      expect(sample_author.first_name).to eq('John')
      expect(sample_author.last_name).to eq('Doe')
    end

    it 'initializes an empty items array' do
      expect(sample_author.items).to be_an(Array)
      expect(sample_author.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the author' do
      item = Item.new(1, 'Action', 'Sample Item', 'Source', Date.new(2022, 1, 1), false)
      sample_author.add_item(item)
      expect(sample_author.items).to include(item)
      expect(item.author).to eq(sample_author)  # Ensure the author of the item is set to the author
    end
  end
end
