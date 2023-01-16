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

  def self.save_files; end

  def self.add_obj_to_people_file(people)
    arr = []
    people.map do |pe|
      if pe.instance_of?(Student)
        arr << { pe.class => { id: pe.id, name: pe.name, age: pe.age, parent_permission: pe.parent_permission } }
      elsif pe.instance_of?(Teacher)
        arr << { pe.class => { id: pe.id, name: pe.name, age: pe.age, specialization: pe.specialization } }
      end
    end

    json = JSON.generate(
      arr,
      @opt
    )

    File.write('data/people.json', json)
  end

  def self.retrieve_data
    File.open('data/people.json')
  end
end
