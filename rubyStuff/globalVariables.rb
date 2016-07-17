p $global # any variable prepended with $ is Nil before declarations
$global = "global is global variable"
p $global

class GlobalContext
  attr_reader :name, :counter

  @@counter = 0

  def initialize(name)
    @name = name
    @counter = @@counter += 1
  end

  def self.current_counter
    @@counter
  end
end

p GlobalContext.current_counter

p GlobalContext.new('asd').counter

p GlobalContext.new('test').counter

p GlobalContext.new('Rafał').counter

p GlobalContext.current_counter