#!/usr/bin/env ruby
require './app'

class Main
  app = App.new
  status = true
  puts 'Welcome to school library app!'
  while status
    puts
    p 'Please choose an option by enterin a number'
    p '1 - List all books'
    p '2 - List all people'
    p '3 - Create a person'
    p '4 - Create a book'
    p '5 - Create a rental'
    p '6 - List all rentals for a given person id'
    p '7 - Exit'

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
      p 'Thank you for using this app!'
      puts
      status = false
    else
      p 'Sorry, you choose a wrong option'
      puts
    end
  end
end

main
