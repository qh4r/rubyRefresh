#1

def is_ancestor?(klass, subclass)
  until((test = subclass.superclass).nil?)
    return true if test == (klass)
    subclass = test
  end
  return false
end

def is_ancestor_recursive?(klass, subclass)
  return true if subclass.superclass == (klass)
  return subclass.superclass.nil? ? false : is_ancestor?(klass, subclass.superclass)
end

class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
end

# Create a class Square here
class Square < Rectangle
  def initialize(side)
    @breadth = @length = side
  end
end

class Fixnum
  def + x
    42
  end
end

class Animal
  def move
    "I can move"
  end

  #wazne by alias byl deklarowany gdy metoda juz istnieje ! - wszystko interpretowane z gory na dol
  alias :can :move
end

class Bird < Animal
  def move
    "#{super} by flying"
  end
end

class Penguin < Bird
  def move
    "#{can} by swimming"
  end
end
class Human < Animal
  def move
    "#{super} by walking"
  end
end

#2

#alt static method

class Item
  @@dupa_global = 'no dupa' #statyczna zmienna

  class << self
    def show
      puts "Class method show invoked"
    end
  end

  def self.do
    p "do do #{@@dupa_global}"
  end
end

Item.show
Item.do


class ApplicationConfiguration
  @@static_map = Hash.new(0) # w nawiasie domyslna wartosc
  def self.set(property_name, value)
    @@static_map[property_name] = value
  end

  def self.get(property_name)
    @@static_map[property_name]
  end
end

ApplicationConfiguration.set("name", "Demo Application")
ApplicationConfiguration.set("version", "0.1")

p ApplicationConfiguration.get("version")

class ApplicationConfiguration
  @configuration = {}

  def self.set(property, value)
    @configuration[property] = value
  end

  def self.get(property)
    @configuration[property]
  end
end

class ERPApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

class WebApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

ERPApplicationConfiguration.set("name", "ERP Application")
WebApplicationConfiguration.set("name", "Web Application")

p ERPApplicationConfiguration.get("name")
p WebApplicationConfiguration.get("name")

p ApplicationConfiguration.get("name")

#zmienne z @@ sa dziedziczone dla wszystkich klas (wspoldziela wartosc wszystkich dzieci itd)
# zmienne z @ sa unikalne dla dzieci i klasy bazowej (wciaz statyczne jesli deklarowane nie w inicjalizacji)
# @asd - class instance variable -- - dostepne tylko metodach klasy (self.fun) klasie
# @@asd  - class variable  -- dostepne metodach kalsy i instancji