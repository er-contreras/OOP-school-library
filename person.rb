# frozen_string_literal: true

# Class for Person
class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(name, age = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age
  end

  private

  def of_age
    @age >= 18
  end
end
