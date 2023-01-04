# frozen_string_literal: true

require_relative 'person'
require_relative 'student'
require_relative 'teacher'

student = Student.new('erick', 'B2', 12)
teacher = Teacher.new('Mateo Sin Apellido', 42, 'Doctor')
p student.validate_name
p teacher.validate_name

p student.name
p teacher.name

