# Define the genre class
# frozen_string_literal: true

require_relative '../items'

class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.set_genre(self)
    @items << item
  end
end
