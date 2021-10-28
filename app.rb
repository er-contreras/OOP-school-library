require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_reader :book, :people, :rentals

  def initialize(books = [], people = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def all_books
    @books.each { |book| p "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def all_people
    @people.each { |person| p "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    p 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option_person = gets.chomp

    p 'Age: '
    age = gets.chomp
    age = 18 if age == ''
    p 'Name: '
    name = gets.chomp
    name = 'Unknown' if name == ''

    case option_person
    when '1'
      p 'Has parent permission? [Y/N]: '
      has_parent_permission = gets.chomp
      has_permission = has_parent_permission.downcase == 'y'
      person = Student.new(age, name, parent_permission: has_permission)
    when '2'
      p 'Specialization: '
      specialization = gets.chomp
      specialization = 'Unknown' if specialization == ''
      person = Teacher.new(age, specialization, name)
    else
      p 'Sorry, you choose a wrong option'
      return
    end
    @people << person unless @people.include?(person)
    p 'Person created successsfully'
  end

  def create_book
    p 'Title: '
    title = gets.chomp
    p 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    p 'Book created successfully'
  end

  def create_rental
    p 'Select a book from the following list by number'
    @books.each_with_index { |book, index| p "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    number_book = gets.chomp
    p
    p 'Select a person from the following list by number(not id)'
    @people.each_with_index do |person, index|
      p "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    number_people = gets.chomp
    p
    p 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @people[number_people.to_i], @books[number_book.to_i])
    @rental << rental unless @rentals.include?(rental)
  end

  def all_rentals_id
    p 'ID of person: '
    id = gets.chomp
    rentals_of_person = @rentals.filter { |rental| rental.person.id == id.to_i }
    p 'Rentals: '
    rentals_of_person.each do |rental|
      p "Date: #{rental.date}, Book:\"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
