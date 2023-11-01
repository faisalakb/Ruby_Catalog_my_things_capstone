# Define the game unit tests
# frozen_string_literal: true

require 'date'
require_relative '../items'
require_relative '../game'

describe Game do
  let(:sample_game) { Game.new(1, 'Action', 'Sample Game', true, Date.new(2020, 1, 1)) }

  describe '#can_be_archived?' do
    context 'when last played more than 2 years ago' do
      it 'returns true' do
        sample_game.last_played_at = Date.new(2019, 1, 1)
        expect(sample_game.can_be_archived?).to be(true)
      end
    end

    context 'when last played less than 2 years ago' do
      it 'returns false' do
        sample_game.last_played_at = Date.new(2022, 1, 1)
        expect(sample_game.can_be_archived?).to be(false)
      end
    end
  end

  describe '#add_item' do
    it 'sets the label of the item to the game' do
      item = Item.new(2, 'Adventure', 'John Doe', 'Source', Date.new(2019, 1, 1), false)
      sample_game.add_item(item)
      expect(item.label).to eq(sample_game)
    end
  end
end
