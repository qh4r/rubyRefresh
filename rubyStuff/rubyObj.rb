class Person
  # parametr domyslny po =
  def initialize(name, mail = '')
    @name = name;
    @mail = mail
  end

  def work
    puts "dunno what to do #{name}"
  end

  #takie getery i setery sa niepraktyczne
  def get_name
    @name
  end

  def set_name (new_name)
    @name = new_name
  end

  # lepszy getter/setter
  # mozna tworzyc setery i getery dla wielu wartosci naraz
  attr_accessor :name, :mail
  # alternatywnie
  # attr_reader
  # attr_writer

  #tak tworzymy metody statyczne
  def self.shoutYourName
    puts "static !!1! - #{self}"
  end
end

#modulu nie da sie utworzyc, tylko wmixowac w klase
module Weapon
  def swing(target)
    puts "#{name} swings at #{target.name}"
  end
end

class King < Person
  include Weapon
  def work
    puts "Well I'm ruling, #{@name} #{@mail}"
  end
end

class Lord < Person
  def work
    puts "Well I'm conspiring, #{@name} #{@mail}"
  end
end

class Peasant < Person
  def work
    #opdwolanie do klasy bazowaj i nadpisywanej metody
    #super wywoluje metode o tej samej nazwie z klasy bazowej
    super
    puts "Well I'm digging, #{@name} #{@mail}"
  end
end

#wszystko musi byc inicjalizowane przed uzyciem

user = King.new('Rafał')
user2 = Lord.new('Asia', 'asia@o2.pl')
user3 = Peasant.new('Tomasz')
user3.work
puts Person

puts Person.ancestors.reduce('') {
    |memo, ancestor| memo.concat(" #{ancestor},")
} #domysla wartosc dla reduce  jako 1 argument

puts user
puts user2

user.work

user2.work

puts user.get_name

user.set_name 'Marian'

user.work

user.name = 'Krzysztof'

puts user.name

user2.mail = 'josziko666@wp.pl'

user2.work

Person.shoutYourName
King.shoutYourName
Peasant.shoutYourName
Lord.shoutYourName

user.swing(user3)





