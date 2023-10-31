require_relative '../items'

class Author < Item
  attr_accessor :id, :first_name, :last_name

  def initialize(_id, first_name, last_name, items = [])
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(item)
    item.set_author(self)
    @items << item
  end
end
