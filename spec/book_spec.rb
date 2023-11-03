# Define the book unit tests

require 'rspec'
require_relative '../book'

RSpec.describe Book do
  let(:book) do
    Book.new('Sample Title', 'Sample Publisher', 'Good')
  end

  describe '#can_be_archived?' do
    context 'when cover state is bad' do
      it 'returns true' do
        book.cover_state = 'bad'
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'when cover state is good' do
      it 'returns false' do
        book.cover_state = 'good'
        expect(book.can_be_archived?).to be_falsy
      end
    end
  end

  describe '#add_item' do
    it 'calls slabel on the added item with self as an argument' do
      item = double('Item')
      expect(item).to receive(:slabel).with(book)
      book.add_item(item)
    end
  end
end
