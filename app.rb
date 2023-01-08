require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :books, :people, :rentals

  def initialize(books = [], people = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def list_all_books
    puts
    puts @books.empty? ? "Empty list" : @books.map { |book| "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    puts
    puts @people.empty? ? "Empty list" : @people.map { |people| "[#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}" }
  end

  def create_person
    puts
    print "Do you want to create a student (1) or teacher (2)? [Input the number]: "
    person = gets.chomp
    if person == "1"
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Has parent permission? [Y/N]: "
      permission = gets.chomp
      puts
      student = Student.new("#{name}", "#{age}", "#{permission}")
      if student
        @people << student
        puts "Person created Succesfully"
      end
    elsif person == "2"
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Specialization: "
      spec = gets.chomp
      puts
      teacher = Teacher.new("#{name}", "#{age}", "#{spec}")
      if teacher
        @people << teacher
        puts "Person created Succesfully"
      end
    elsif person != "1" || person != "2"
      puts "Wrong Number"
    end
  end

  def create_book
    puts
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    puts
    book = Book.new("#{title}", "#{author}")
    if book
      @books << book
      puts "Book created successfully"
    end
  end

  def create_rental
    puts
    return puts "No Books or People available!" if @books.empty? || @people.empty?

    puts "Select a book from the following list by number"
    puts @books.map.with_index { |book, idx| "#{idx}) Title: #{book.title}, Author: #{book.author}" }
    book = gets.chomp
    puts "Select a person from the following list (no id)"
    puts @people.map.with_index { |people, idx| "#{idx}) [#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}" }
    person = gets.chomp
    print "Date: "
    date = gets.chomp
    rental = Rental.new(date, @people[person.to_i], @books[book.to_i])
    if rental
      @rentals << rental
      puts "Rental created successfully"
    end
  end

  def list_all_rentals

  end
end
