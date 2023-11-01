require 'date'
require_relative 'items'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, genre, label, multiplayer, last_played_at, archived: false)
    super(id, genre, nil, nil, label, Date.new(2000, 1, 1), archived) # Set author, source, and publish_date as placeholders
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
