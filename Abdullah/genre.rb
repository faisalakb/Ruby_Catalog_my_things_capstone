# Define the genre class

require_relative '../items'

class Genre
  attr_accessor :id, :name, :items

  def initialize(_id, name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.set_genre(self)
    @items << item
  end

  def to_h
    {
      'id' => id,
      'name' => name
    }
  end

  def self.load_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      genres_data = JSON.parse(json_data)
      genres_data.map do |data|
        Genre.new(data['id'], data['name'])
      end
    else
      []
    end
  end

  def self.save_to_json(geners, filename)
    File.open(filename, 'w') do |file|
      data = geners.map(&:to_h)
      file.write(JSON.generate(data))
    end
  end
end
