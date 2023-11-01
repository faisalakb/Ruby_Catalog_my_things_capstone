# frozen_string_literal: true

# book.rb

class Book
  attr_accessor :title, :publisher, :cover_state

  def initialize(title, publisher, cover_state)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad'
  end

  def add_item(item)
    item.set_label(self)
  end

  def to_h
    {
      'title' => title,
      'publisher' => publisher,
      'cover_state' => cover_state
    }
  end

  def self.load_books_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      books_data = JSON.parse(json_data)
      books_data.map do |data|
        Book.new(data['title'], data['publisher'], data['cover_state'])
      end
    else
      []
    end
  end

  def self.save_books_to_json(books, filename)
    File.open(filename, 'w') do |file|
      data = books.map(&:to_h)
      file.write(JSON.generate(data))
    end
  end
end
