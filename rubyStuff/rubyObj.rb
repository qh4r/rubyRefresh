class User
  # parametr domyslny po =
  def initialize(name, mail = '')
    @name = name;
    @mail = mail
  end

  def dig
    puts "Well I'm digging #{@name} #{@mail}"
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
end

user = User.new('Rafał')
user2 = User.new('Asia', 'asia@o2.pl')

puts User

puts User.ancestors.reduce('') {
    |memo, ancestor| memo.concat(" #{ancestor},")
} #domysla wartosc dla reduce  jako 1 argument

puts user
puts user2

user.dig

user2.dig

puts user.get_name

user.set_name 'Marian'

user.dig

user.name = 'Krzysztof'

puts user.name

user2.mail = 'josziko666@wp.pl'

user2.dig



