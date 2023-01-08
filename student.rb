require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(name, classroom = "Unknown", age, parent_permission)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
