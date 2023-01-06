# frozen_string_literal: true

require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

student = Student.new('erick', 'B2', 12)
student2 = Student.new('Francis', 'B2', 14)
teacher = Teacher.new('Mateo Sin Apellido', 42, 'Doctor')

classroom = Classroom.new('B4')
classroom.add_student(student)
classroom.students[0].classroom.label

p student.classroom.students[0].name

