require_relative '../items'

class Genre < Item
  attr_accessor :id, :name

  def initialize(_id, name, items = [])
    super()
    @id = Random.rand(1..1000)
    @name = name
    @items = items
  end

  def add_item(item)
    item.set_genre(self)
    @items << item
  end
end
