#0.0
class Array #rozszerza typ array
  def foldl(method) # wykonuje dowolna metode na elementach tablicy
    inject {|result, i| result ? result.send(method, i) : i } # inject == reduce
  end
end

class String
  def words
    split(" ")
  end
end

#1.0

class Nomad
  def initialize(glider)
    @glider = glider
  end

  def do(action)
    @glider.send(action)
  end
end

class Nomad
  def initialize(glider)
    @glider = glider
  end

  def do(action, argument = nil)
    if argument == nil
      @glider.send(action)
    else
      @glider.send(action, argument) # send przekazuje kolejne argumenty jako parametry wywolywanej funkcji
    end
  end
end

#send pozwala na wywolywanie metod prywatnych

def relay(array, data_type)
  array.map(&:"to_#{data_type}")
end

#1.1
class Spy
  def method_missing(sym, *args, &block)
    p [sym, *args] #* to rest
    p block.call(args) unless block.nil?
  end
end

class MethodCall
  def initialize(sym, args)
    @sym = sym
    @args = args
  end

  def sym
    @sym
  end

  def args
    @args
  end

  def ==(other_call)
    @sym == other_call.sym && @args == other_call.args
  end
end

class Spy
  def initialize
    @method_calls = []
  end

  def method_missing(sym, *args)
    @method_calls.push(MethodCall.new(sym, args))
  end

  def method_called?(sym, *args)
    @method_calls.include?(MethodCall.new(sym,args))  #dziala dzieki temu ze na MEthodCall zdefuniowane jest ==
  end
end

class Spy
  def initialize(enemy_agent)
    @enemy_agent = enemy_agent
  end

  def method_missing(sym, *args)
    @enemy_agent.send(sym, *args)
  end
end

#1.1
#dynamiczna generacja metod
class Monk
  ['life', 'the_universe', 'everything'].map do |subject|
    define_method("meditate_on_#{subject}") { "I know the meaning of #{subject.sub('_', ' ')}" }
  end
end