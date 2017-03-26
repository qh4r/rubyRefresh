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

#ruby porownuje obiekty (funkcja .eql?) przez generowanie hashy w taki sposob:
p 2.hash
p "test".hash

#porownujac dobrze nadpisywac hash a zawsze napisywac eql? i == bo niektore metody uzywaja eql
class Item
  attr_reader :item_name, :qty

  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end

  def to_s
    "Item (#{@item_name}, #{@qty})"
  end

  def hash
    self.item_name.hash ^ self.qty.hash #XOR dwoch haszy
  end

  def eql?(other_item)
    puts "#eql? invoked"
    @item_name == other_item.item_name && @qty == other_item.qty
  end

  def ==(other)
    puts "== !"
    eql?(other)
  end

end

p Item.new("abcd", 1).hash
p (Item.new("abcd", 1) == Item.new("abcd", 1))
items = [Item.new("abcd", 1), Item.new("abcd", 1), Item.new("abcd", 1)]
p items.uniq

class Item
  def initialize(item_name, quantity, supplier_name, price)
    @item_name = item_name
    @quantity = quantity
    @supplier_name = supplier_name
    @price = price
  end

  def hash
    @item_name.hash ^ @quantity.hash ^ @suplier_name.hash ^ @proce.hash
  end

  def == (other)
    hash == other.hash
  end

  def eql? (other)
    self == other
  end
  # implement ==, eql? and hash
end

#o dziwo puts wypisuje wartosc .to_s Z AUTOMATU, a p wywoluje metode inspec tez  Z AUTOMATU
class Item2
  def inspect
    "Result of inspect"
  end
end

puts Item2.new
puts Item2.new.to_s
p Item2.new

#serialization

class Ogre
  attr_accessor :strength, :speed, :smell
  def initialize(strength, speed, smell)
    @strength = strength
    @speed = speed
    @smell = smell
  end
end

class Dragon
  attr_accessor :strength, :speed, :color
  def initialize(strength, speed, color)
    @strength = strength
    @speed = speed
    @color = color
  end
end

class Fairy
  attr_accessor :strength, :speed, :intelligence
  def initialize(intelligence)
    @strength = 1
    @speed = 42
    @intelligence = intelligence
  end
end

def save_game(characters)
  yaml = YAML::dump(characters)
  game_file = GameFile.new("saved.yaml")
  game_file.write(yaml)
end

def load_game
  game_file = GameFile.new("saved.yaml")
  yaml = game_file.read
  YAML::load(yaml)
end

def compute(ary)
  return nil if ary.nil?
  ary.map { |(a,b)| a+(b||0)}
end

# destrukturyzacja w ruby nie wymaga by res byl na koncu
# - dziala zawsze biorac do resta tyle ile zostanie po uzupelnieniu reszty zmiennych
first, *middle, last = [42, 43, 44, 45, 46, 47]

#mediana
def median(*list)
  return nil if list.nil?
  center = (list.length-1)/2
  mid, after_mid = list.sort[center..((list.length/2) % 2 == 1 ? center : center +1)]
  after_mid.nil? ? mid : (mid+after_mid) / 2.0
end

#splashowac mozna tez prawa strone
asd = *(1..42)
dsa = *"dsa"

#count moze tez zwrocic liczbe wystapien elementu jesli go podamy - mozna tez blok
puts [42, 8, 15, 16, 23, 42].count(42)

#ilosc zagniezdzen jakie usunie flattem mozna kontrolować parametrem
[4, [8], [15], [16, [23, 42]]].flatten(2)
[4, [8], [15], [16, [23, 42]]].flatten(1)

#compac usuwa nil
p [nil, 4, nil, 8, 15, 16, nil, 23, 42, nil].compact

def few2last(array)
  array.slice(-2..-1).join("|")
end


class Stack
  def initialize(size)
    @max_length = size
    @store = []
  end

  def pop
    @store.pop
  end

  def push(element)
    p [element, element.nil?, full?, size, @store.length]
    if full? or element.nil?
      nil
    else
      @store.push(element)
      @store
    end
  end

  def size
    @max_length
  end

  def look
    @store.last
  end

  private

  def full?
    @store.length == @max_length
  end

  def empty?
    @store.length == 0
  end
end

class WaiterRobot

  def initialize(chef, tables)
    @chef = chef
    @tables = tables
    @name = "Tyler Durden"
  end

  def name
    @name
  end

  def place_order(table_number, sandwich, drink)
    @chef.new_order(self, {table: table_number, sandwich: sandwich, drink: drink})
  end

  def serve(order)
    table_nr, sandwitch, drink = order.select {|x| !x.is_a? Symbol}
    @tables[table_nr].serve_sandwich(sandwitch)
    @tables[table_nr].serve_drink(drink)
  end

  def serve2(order)
    # przeksztalca tablice  sybol, dane, symbol, dane na hasz
    o = Hash[*order]
    table_number = o[:table]
    table = @tables[table_number]
    table.serve_sandwich(o[:sandwich])
    table.serve_drink(o[:drink])
  end

end

CHARACTERS = ["Joey Jeremiah", "Snake Simpson", "Wheels", "Spike Nelson", "Arthur Kobalewscuy", "Caitlin Ryan", "Shane McKay", "Rick Munro", "Stephanie Kaye"]
#permutacje
def degrassi_couples
  CHARACTERS.map {|char| CHARACTERS.map {|x| [char, x] if char != x}}.flatten(1).compact
end

def degrassi_couples2
  all = CHARACTERS.product(CHARACTERS) #permutacje?
  all.reject {|c| c.first == c.last}
end