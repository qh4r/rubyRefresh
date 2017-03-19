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
