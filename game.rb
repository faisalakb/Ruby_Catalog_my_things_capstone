# Define the game class
# frozen_string_literal: true

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, genre, label, multiplayer, last_played_at)
    super(id, genre, nil, label, Date.new(2000, 1, 1), false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    parent_result = super
    age_in_years = (Date.today - @last_played_at).to_i / 365

    parent_result && age_in_years > 2
  end

  def to_h
    {
      'genre' => genre,
      'label' => label.to_h,
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at.to_s
    }
  end

  def self.load_games_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      games_data = JSON.parse(json_data)
      games_data.map do |data|
        label = Label.new(data['label']['id'], data['label']['title'], data['label']['color'])
        Game.new(data['id'], data['genre'], label, data['multiplayer'], Date.parse(data['last_played_at']))
      end
    else
      []
    end
  end

  def self.save_games_to_json(games, filename)
    File.open(filename, 'w') do |file|
      data = games.map(&:to_h)
      file.write(JSON.generate(data))
    end
  end

  def add_item(item)
    item.label = self
  end
end
