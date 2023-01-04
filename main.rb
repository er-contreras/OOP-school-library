# frozen_string_literal: true

require_relative 'person'
require_relative 'student'
require_relative 'teacher'

student = Student.new('Erick', 'B2', 33)
teacher = Teacher.new('Mateo', 42, 'Doctor')
p student
p teacher
