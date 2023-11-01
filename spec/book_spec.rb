require 'rspec'
require_relative '../book'

RSpec.describe Book do
  let(:book) do
    Book.new('Sample Book', 'Sample Author',
             'Fiction', nil, 'Publisher', 'Good')
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
    it 'calls set_label on the added item with self as an argument' do
      item = double('Item')
      expect(item).to receive(:set_label).with(book)
      book.add_item(item)
    end
  end

  describe '#set_label' do
    it 'sets the label of the book to the specified label' do
      new_label = 'New Label'
      book.set_label(new_label)
      expect(book.label).to eq(new_label)
    end
  end
end
