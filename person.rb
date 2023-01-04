# frozen_string_literal: true

require_relative 'corrector'

# Class for Person
class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(name, age = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def can_use_services?
    of_age
  end

  def validate_name
    corrected_name = @corrector.correct_name(@name)
    @name = corrected_name
  end

  private

  def of_age
    @age >= 18
  end
end
