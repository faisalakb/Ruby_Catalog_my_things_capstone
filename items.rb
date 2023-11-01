require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, genre, author, source, _label, publish_date, archived)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = labelrequire_relative '../label'
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    age_in_years = (Date.today - @publish_date).to_i / 365
    age_in_years > 10
  end

  def genre(genre)
    @genre = genre
  end

  def author(author)
    @author = author
  end

  def source(source)
    @source = source
  end

  def label(label)
    @label = label
  end
end
