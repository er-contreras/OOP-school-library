# frozen_string_literal: true

require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

student = Student.new('erick', 'B2', 12)
teacher = Teacher.new('Mateo Sin Apellido', 42, 'Doctor')

book = Book.new('Atomic Habits', 'James Clear')

rental = Rental.new('12-12-2023', student, book)
rental.person.rentals[0].book.title

student.rentals[0].book.title

p book.rentals[0].person.name
