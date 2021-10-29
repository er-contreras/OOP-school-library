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
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def all_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option_person = gets.chomp

    print 'Age: '
    age = gets.chomp
    age = 18 if age == ''
    print 'Name: '
    name = gets.chomp
    name = 'Unknown' if name == ''

    case option_person
    when '1'
      print 'Has parent permission? [Y/N]: '
      has_parent_permission = gets.chomp
      has_permission = has_parent_permission.downcase == 'y'
      person = Student.new(age, name, parent_permission: has_permission)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      specialization = 'Unknown' if specialization == ''
      person = Teacher.new(age, specialization, name)
    else
      puts 'Sorry, you choose a wrong option'
      return
    end
    @people << person unless @people.include?(person)
    puts 'Person created successsfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    number_book = gets.chomp
    puts
    puts 'Select a person from the following list by number(not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    number_people = gets.chomp
    puts
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @people[number_people.to_i], @books[number_book.to_i])
    @rentals << rental unless @rentals.include?(rental)
  end

  def all_rentals_id
    print 'ID of person: '
    id = gets.chomp
    rentals_of_person = @rentals.filter { |rental| rental.person.id == id.to_i }
    puts 'Rentals: '
    rentals_of_person.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
