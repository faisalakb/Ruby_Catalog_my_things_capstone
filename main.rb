# Define the main class
# frozen_string_literal: true

require 'date'
require_relative 'items'
require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative './Abdullah/author'
require_relative './Abdullah/genre'
require_relative './Abdullah/music'
require 'json'

labels = []
games = []
authors = []
genres = []
albums = []

# Load data from JSON files
books = Book.load_books_from_json('./json/books.json')
labels = Label.load_labels_from_json('./json/labels.json')
games = Game.load_games_from_json('./json/games.json')
authors = Author.load_from_json('./json/authors.json')
genres = Genre.load_from_json('./json/genres.json')
albums = MusicAlbum.load_from_json('./json/albums.json')

loop do
  puts "\nMain Menu:"
  puts '1. List all books'
  puts '2. List all games'
  puts '3. List all labels'
  puts '4. List all authors'
  puts '5. List all genres'
  puts '6. List all Music Albums'
  puts '7. Add a label'
  puts '8. Add a book'
  puts '9. Add a game'
  puts '10. Add an author'
  puts '11. Add a genre'
  puts '12. Add a Music album'
  puts '13. Quit'

  print 'Please choose an option: '
  choice = gets.chomp.to_i

  case choice
  when 1
    puts 'List of Books:'
    books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  when 2
    puts 'List of Games:'
    games.each_with_index do |game, index|
      puts "#{index + 1}. Genre: #{game.genre}, Multiplayer: #{game.multiplayer}, " \
           "Last Played At: #{game.last_played_at}, Archived: #{game.archived}"
    end
  when 3
    puts 'List of Labels:'
    labels.each_with_index do |label, index|
      puts "#{index + 1}. Title: #{label.title}, Color: #{label.color}"
    end
  when 4
    puts 'List of Authors:'
    authors.each_with_index do |author, index|
      puts "#{index + 1}. First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  when 5
    puts 'List of Genres:'
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. Name: #{genre.name}"
    end
  when 6
    puts 'List of Music Albums:'
    albums.each_with_index do |album_item, index|
      puts "#{index + 1}. Name: #{album_item.name}, Genre: #{album_item.genre}, " \
           "Singer: #{album_item.singer}, On spotify: #{album_item.on_spotify}"
    end
  when 7
    puts 'Add a new label:'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(labels.length + 1, title, color)
    labels << label
    puts 'Label added successfully.'
  when 8
    puts 'Add a new book:'
    print 'Title: '
    title = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State (good/bad): '
    cover_state = gets.chomp
    book = Book.new(title, publisher, cover_state)
    books << book
    puts 'Book added successfully.'
  when 9
    puts 'Add a new game:'
    print 'Genre: '
    genre_name = gets.chomp
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
      game = Game.new(games.length + 1, genre_name, label, multiplayer, last_played_at)
      games << game
      label.add_game(game)
      puts 'Game added successfully.'
    end

  when 10
    puts 'Add an author:'
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    author = Author.new(authors.length + 1, first_name, last_name)
    authors << author
    puts 'Author added successfully.'
  when 11
    puts 'Add a genre:'
    print 'Name: '
    name = gets.chomp
    genre = Genre.new(1, name)
    genres << genre
    puts 'Genre added successfully.'
  when 12
    puts 'Add a Music Album:'
    print 'Name: '
    name = gets.chomp
    print 'Genre: '
    genre = gets.chomp
    print 'Singer: '
    singer = gets.chomp
    print 'Is it on spotify (Y/N): '
    on_spotify = gets.chomp
    album = MusicAlbum.new(1, name, genre, singer, on_spotify)
    albums << album
    puts 'Music Album added successfully.'
  when 13
    puts 'Exiting the application. Goodbye!'
    Book.save_books_to_json(books, './json/books.json')
    Game.save_games_to_json(games, './json/games.json')
    Label.save_labels_to_json(labels, './json/labels.json')
    Author.save_to_json(authors, './json/authors.json')
    Genre.save_to_json(genres, './json/genres.json')
    MusicAlbum.save_to_json(albums, './json/albums.json')
    puts 'Saving data in JSON files.'
    break
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end
