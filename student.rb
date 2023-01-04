# freeze_string_literal: true

# Person class
class Student < Person
  attr_reader :classroom

  def initialize(name, classroom, age)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
