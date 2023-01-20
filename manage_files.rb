require_relative 'app'
require 'fileutils'
require 'json'
require 'pry'

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
    # Item is the object without being into an array. The hash is just an empty hash.
    json_object = people.each_with_object({}) do |item, hash|
      if item.instance_of?(Student)
        hash[item.class] ||= []
        hash[item.class] << { id: item.id, name: item.name, age: item.age, parent_permission: item.parent_permission }
      elsif item.instance_of?(Teacher)
        hash[item.class] ||= []
        hash[item.class] << { id: item.id, name: item.name, age: item.age, specialization: item.specialization }
      end
    end

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
