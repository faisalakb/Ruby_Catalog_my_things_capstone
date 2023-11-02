require_relative '../items'

class Author
  attr_accessor  :id, :first_name, :last_name, :items

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

  def to_h
    {
      'id' => @id,
      'first name' => first_name,
      'last name' => last_name
    }
  end

  def self.load_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      authors_data = JSON.parse(json_data)
      authors_data.map do |data|
        Author.new(data['id'], data['first name'], data['last name'])
      end
    else
      []
    end
  end

  def self.save_to_json(authors, filename)
    File.open(filename, 'w') do |file|
      data = authors.map(&:to_h)
      file.write(JSON.generate(data))
    end
  end
end
