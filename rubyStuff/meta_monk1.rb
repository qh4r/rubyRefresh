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

#2.0
def test;
  p "test test";
end

self.send(:test) # wszystko deklarowane globalnie znjaduje sie na swego rodzaju globalnym kontekscie
# - tutaj self odnosi sie do tego

self.method(:test).owner # Object -- nalezy do
self.method(:test).receiver #main -- jest powiazana


editor = Editor.new("class Foo; end")

def auto_complete(editor)
  editor.cursor.read do |word|
      if word == "\n"
        throw :eol
    elsif editor.template.user_classes.include?(word)
      list = eval(word.to_s).methods #eval parsuje to co mu podamy, więc jesli dostanie nazwe klasy to sparsuje referencje do niej
      # jesli metode to referencje do metody w danym kontekscie

      # zamiast evala mozna uzyc Module.const_get lub Class.const_get - class dziedziczy po module
      build_suggestion(list)
    elsif editor.template.context.methods.include?(word)
      list = editor.template.context.method(word).parameters
      build_suggestion(list)
    end
  end
end

def build_suggestion(list)
  Suggestion.new(list).display
end

#2.1
def inspect_instance_variable(class_name, variable)
  Module.const_get(class_name).new.instance_variable_get("@#{variable}")
end

#instance_variable_get niszczy enkapsulacje