require_relative '../items'
require_relative '../label'

describe Label do
  let(:sample_label) { Label.new(1, 'Sample Label', 'Red') }

  describe '#initialize' do
    it 'sets the id, title, and color correctly' do
      expect(sample_label.id).to eq(1)
      expect(sample_label.title).to eq('Sample Label')
      expect(sample_label.color).to eq('Red')
    end

    it 'initializes an empty items array' do
      expect(sample_label.items).to be_an(Array)
      expect(sample_label.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      item = Item.new(1, 'Action', 'John Doe', 'Source', 'Game Item', Date.new(2020, 1, 1), false)
      sample_label.add_item(item)
      expect(sample_label.items).to include(item)
    end

    it 'sets the label of the added item to self' do
      item = Item.new(2, 'Adventure', 'Jane Smith', 'Another Source', 'Another Item', Date.new(2019, 1, 1), false)
      sample_label.add_item(item)
      expect(item.label).to eq(sample_label)
    end
  end
end
