# Define the item class

require 'date'

class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(id, genre, author, label, publish_date, archived)
    @id = id
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    age_in_years = (Date.today - @publish_date).to_i / 365
    age_in_years > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def set_genre(genre)
    @genre = genre
  end

  def set_author(author)
    @author = author
  end

  def set_label(label)
    @label = label
  end
end
