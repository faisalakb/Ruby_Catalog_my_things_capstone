# this is label class
class Label
  attr_accessor :id, :title, :color, :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = [] # Initialize items as an empty array
  end

  def add_item(item)
    @items << item
    item.set_label(self)
  end
end
