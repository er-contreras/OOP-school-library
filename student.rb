require './person'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission = true, classroom = 'B8')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
