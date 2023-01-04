# frozen_string_literal: true

require_relative 'person'
require_relative 'student'
require_relative 'teacher'

student = Student.new('Erick', 'B2', 12)
teacher = Teacher.new('Mateo', 42, 'Doctor')
p student.can_use_services?
p teacher.can_use_services?
