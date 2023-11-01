# Represents a book with various attributes such as title, author, genre, etc.

class Book
  attr_accessor :title, :author, :genre, :publisher, :cover_state, :label

  def initialize(title, author, genre, publisher, cover_state)
    @title = title
    @author = author
    @genre = genre
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad'
  end

  def add_item(item)
    item.label = self
  end
end
