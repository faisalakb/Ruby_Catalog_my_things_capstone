class Book
    attr_accessor :title, :author, :genre, :label, :publisher, :cover_state
  
    def initialize(title, author, genre, label, publisher, cover_state)
      @title = title
      @author = author
      @genre = genre
      @label = label
      @publisher = publisher
      @cover_state = cover_state
    end
  
    def can_be_archived?
      super || @cover_state == "bad"
    end
  end
  