require './student'
require './corrector'
require './rental'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = validate_name(name)
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def can_use_services?
    if @age >= 21
      true
    elsif @parent_permission == true
      false
    end
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end
end
