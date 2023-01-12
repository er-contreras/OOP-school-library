require 'fileutils'

module ManageFiles
  def self.create_files
    FileUtils.mkdir_p('data') # Create a directory if doesn't exists
    File.new('data/people.json', File::CREAT)
    File.new('data/books.json', File::CREAT)
    File.new('data/rentals.json', File::CREAT)
  end

  def self.save_files; end
end
