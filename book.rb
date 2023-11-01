# this is book class
# frozen_string_literal: true

class Book
  attr_accessor :title, :publisher, :cover_state

  def initialize(title, publisher, cover_state)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def add_item(item)
    item.set_label(self)
  end
end
