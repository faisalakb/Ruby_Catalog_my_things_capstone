# Define the author class
# frozen_string_literal: true

require_relative '../items'

class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.set_author(self)
    @items << item
  end
end
