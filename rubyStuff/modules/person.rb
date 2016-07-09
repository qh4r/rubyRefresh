require 'json'

class Person
  attr_accessor :email, :name, :permissions

  # * sprawia ze przyjmowana jest tablica argumentow
  def initialize(*args)
    @name = args[0]
    @emial = args[1]
    @permissions = Person.load_from_file
  end

  def self.load_from_file
    file = File.read 'permissions.json'
    JSON.load(file, symbolize_name: true)
  end

  def save
    new_json = {email: @mail, name: @name, permissions: @permissions}.to_json
    #otwiera plik w trybie append
    open('people.json', 'a') {
      |file| file.puts new_json
    }
  end
end