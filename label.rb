class Label
    attr_accessor :id, :title, :color, :items
  
    def initialize(id, title, color)
      @id = id
      @title = title
      @color = color
      @items = [] # Initialize items as an empty array
    end
  
    # Method to add an item to the collection
    def add_item(item)
      @items << item
      item.set_label(self) # Set self as the label of the item
    end
  end
  