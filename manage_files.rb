require_relative 'app'
require 'fileutils'
require 'json'

module ManageFiles
  @opt = {
    array_nl: "\n",
    object_nl: "\n",
    indent: '  ',
    space_before: ' ',
    space: ' '
  }

  def self.create_files
    FileUtils.mkdir_p('data') # Create a directory if doesn't exists
    File.new('data/people.json', File::CREAT)
    File.new('data/books.json', File::CREAT)
    File.new('data/rentals.json', File::CREAT)
  end

  def self.add_obj_to_people_file(people)
    json_object = people.each_with_object(Hash.new(0)) do |pe, instance|
      if pe.instance_of?(Student)
        instance[pe.class] = { id: pe.id, name: pe.name, age: pe.age, parent_permission: pe.parent_permission }
      elsif pe.instance_of?(Teacher)
        instance[pe.class] = { id: pe.id, name: pe.name, age: pe.age, specialization: pe.specialization }
      end
    end

    p json_object

    json = JSON.generate(
      json_object,
      @opt
    )

    File.write('data/people.json', json)
  end

  def self.retrieve_data(file_path)
    file = File.read(file_path)
    JSON.parse(file)
  end
end
