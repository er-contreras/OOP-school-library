module People
  def student_statement(person)
    if person == '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      puts
      student = Student.new(name, age, permission)
      if student
        @people << student
        puts 'Person created Succesfully'
      end
    end
  end

  def teacher_statement(person)
    if person == '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      spec = gets.chomp
      puts
      teacher = Teacher.new(name, age, spec)
      if teacher
        @people << teacher
        puts 'Person created Succesfully'
      end
    end
  end
end
