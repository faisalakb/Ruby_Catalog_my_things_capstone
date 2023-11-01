# this is label class
# frozen_string_literal: true

class Label
  attr_accessor :id, :title, :color, :items, :games

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
    @games = []
  end

  def add_game(game)
    @games << game
  end

  def to_h
    {
      'id' => id,
      'title' => title,
      'color' => color
    }
  end

  def self.load_labels_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      labels_data = JSON.parse(json_data)
      labels_data.map do |data|
        Label.new(data['id'], data['title'], data['color'])
      end
    else
      []
    end
  end

  def self.save_labels_to_json(labels, filename)
    File.open(filename, 'w') do |file|
      data = labels.map(&:to_h)
      file.write(JSON.generate(data))
    end
  end
end
