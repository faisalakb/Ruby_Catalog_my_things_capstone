require_relative '../items'
require_relative '../label'
require_relative '../game'

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

  describe '#add_game' do
    it 'adds a game to the label' do
      game = Game.new(1, 'Action', 'Sample Game', true, Date.new(2020, 1, 1))
      sample_label.add_game(game)
      expect(sample_label.games).to include(game)
    end
  end
end
