#!/usr/bin/env ruby
require './app'

class Main
  app = App.new
  status = true
  puts 'Welcome to school library app!'
  while status
    puts
    puts 'Please choose an option by enterin a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp

    case option
    when '1'
      app.all_books
    when '2'
      app.all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.all_rentals_id
    when '7'
      puts 'Thank you for using this app!'
      puts
      status = false
    else
      puts 'Sorry, you choose a wrong option'
      puts
    end
  end
end
