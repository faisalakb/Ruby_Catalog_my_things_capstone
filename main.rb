require 'date'
require_relative 'items'
# require_relative 'book'
# require_relative 'label'
# require_relative 'game'

require_relative 'Abdullah/author'
require_relative 'Abdullah/genre'
require_relative 'Abdullah/music'

books = []
labels = []
games = []
genres = []
authors = []

loop do
  puts "\nMain Menu:"
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. Add a book'
  puts '4. Add a label'
  puts '5. List all games'
  puts '6. Add a game'
  puts '7. Add an author'
  puts '8. Add a genre'
  puts '9. List Authors'
  puts '10. List Genres'
  puts '11. Quit'
  print 'Please choose an option: '
  choice = gets.chomp.to_i
  case choice
  when 1
    puts 'List of Books:'
    books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}, Genre: #{book.genre}, Label: #{book.label}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  when 2
    puts 'List of Labels:'
    labels.each_with_index do |label, index|
      puts "#{index + 1}. Title: #{label.title}, Color: #{label.color}"
    end
  when 3
    puts 'Add a new book:'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Genre: '
    genre = gets.chomp
    print 'Label: '
    label_name = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State (good/bad): '
    cover_state = gets.chomp
    label = labels.find { |lbl| lbl.title == label_name }
    if label.nil?
      puts 'Label not found. Please add the label first.'
    else
      book = Book.new(title, author, genre, label, publisher, cover_state)
      books << book
      puts 'Book added successfully.'
    end
  when 4
    puts 'Add a new label:'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color, 1)
    labels << label
    puts 'Label added successfully.'
  when 5
    puts 'List of Games:'
    games.each_with_index do |game, index|
      puts "#{index + 1}. Genre: #{game.genre}, Label: #{game.label}, Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at}, Archived: #{game.archived}"
    end
  when 6
    puts 'Add a new game:'
    print 'Genre: '
    genre = gets.chomp
    print 'Label: '
    label_name = gets.chomp
    print 'Multiplayer (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Last Played At (YYYY-MM-DD): '
    last_played_at = Date.parse(gets.chomp)
    label = labels.find { |lbl| lbl.title == label_name }
    if label.nil?
      puts 'Label not found. Please add the label first.'
    else
      game = Game.new(genre, label, multiplayer, last_played_at)
      games << game
      puts 'Game added successfully.'
    end
  when 7
    puts 'Add author:'
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    new_author = Author.new(1, first_name, last_name)
    authors << new_author
    puts 'Author added successfully.'
    puts authors
  when 8
    puts 'Add genre:'
    print 'Genre Name: '
    new_genre = gets.chomp
    genre = Genre.new(1, new_genre)
    genres << new_genre
    puts 'Genre added successfully.'
  when 9
    puts 'List of Authors:'
    authors.each_with_index do |author, index|
      puts "#{index + 1}. First Name: #{author.first_name}, Last Name: #{author.last_name}, ID: #{author.id}"
    end
  when 10
    puts 'List of Geners:'
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. Genre Name: #{genre.name}, ID: #{genre.id}"
    end
  when 11
    puts 'Exiting the application. Goodbye!'
    break
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end
