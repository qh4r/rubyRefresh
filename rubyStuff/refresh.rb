def hello(a)
  return "Hello world #{a}!"
end

test = hello("Rafał")

puts test.upcase

formater = "Nazywam się %{name} i mam %{age} lat"

puts formater % {name: "Rafał", age: "23"}

puts "Rafał" == 'Rafał'

puts formater.class #String

puts test.class #String

string = String.new('utworzone konsturktorem')

puts string

imie = gets.chomp #samo gets tez dziala

puts imie