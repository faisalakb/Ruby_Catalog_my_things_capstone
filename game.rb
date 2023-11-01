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

  def add_item(item)
    item.set_label(self)
  end
end
