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

zmiana = "Korol karol kupil \n krulowej katolinie \n korale i korale";

zmiana['korale'] = 'rózgę' #WYMIENIA PIERWSZE WYSTAPIENIE DOPASOWANEGO SLOWA W StRINGU

puts zmiana.lines.to_a #TWORZY TABLICE Z LINII


puts zmiana

# imie = gets.chomp #samo gets tez dziala

# puts imie

puts 3.to_f; #da 3.0


puts "3 is odd? #{3.odd?}"
puts "even ? #{3.even?}"

puts rand #daje random 0-1

puts rand(10) #daje 0-10

3.times {
    |test| puts "hehe "+test.to_s #iteruje od zera!!
}

def create_string(args)
  str = "";
  args.each { |number| str += (number.to_s + " ") }
  str.downcase #return jest domyslny jak w js
end

puts create_string(["asdasd", 42, 43])

symbol = :Test #symbol

tt = 0
if tt > 0
  puts "blabla"
elsif tt < 0
  puts "hyhyhy"
else
  puts "tutu"
end

case tt # odpowiednik switch nie przelatuje do pozniejszych
  when 2
    puts "dwa"
  when 1
    puts "jeden"
  when 0
    puts "zero"
end
range = 1..4 #zakres (Range)

tab = [32, 43, 32, "dupa", [1, 2, 3]]

puts tab.include? 32 && 43

tab.reverse! #wyrazenia z wykrzyknikami działaja na obiekcie!
# nie wymagaja przypisania do noewego
display = "król karol kupił królowej"
puts display
display.upcase! #dziala na stringu (pewnie tworzy  nowy pod spodem)
puts display

tablica = (5..15).to_a #szybka tablica
#potrzebny jest nawias

puts tablica.class
puts tablica
tablica.shuffle! #miesza!
puts tablica

tablica << 100 #dodanie na koniec
#mozna tez zrobic .push
puts tablica.last
#dziala tez shif unshift pop

puts tablica.length
puts tablica.pop
puts tablica.length
puts tablica.shift
puts tablica.length
#inny sposob iteracji (.each lepszy)

for t in tablica
  puts "z tablicy #{t}"
end

tablica.each do |t|
  puts "z do #{t}"
end

#preferowana metoda to .each {|| ...} bez do

tablica.select! {|t| t.even?} #fitruje == %2 de fakto

puts "\npo filtrze modulo"
puts tablica

#uzywanie stringow jako kluczy slownikow
dane = {'name' => 'Rafał', 'surname' => 'Kucharski', 'age' => 25}

puts dane['surname']

#uzywanie symboli jako kluczy
dane2 = {name: 'Rafał', surname: 'Kucharski'}

puts dane2[:name]

dane2[:age] = 25
dane2[:address] = {street: "Sobieskiego", flat: 4}
dane2.delete(:name)
puts dane2;

dane2.each {
  |key, value| puts "#{key} => #{value}"
  dane2.delete(key) if key == :age #mozna odwrocic if gdy tylko 1 sprawdzenie
  #DA SIE USUWAC ELEMEMNTY PO KTORYCH SIE ItERUJE
}

puts "#{dane2} \n #{dane2.include?(:dupa)}, #{dane2.include?(:address)}"


ratings = Hash.new(0) #tworzy hashtable z domyslna wartoscia dla elementu ustawiona na 0
books = {
    "Gra o tron" => :super,
    "50 twarzy graya" => :dno,
    "Harry potter" => :super,
    "Taniec ze smokami" => :spoko
}
books.values.each { |rate| ratings[rate] += 1} #wypelnia slownik na podstawie innego nice!

puts ratings
print "adsasd"
#print nie dodanje znaku nowej lini tak jak puts
print "asdsada"

#taka petla
loop {
  break #żeby nie wkurzala
  puts "pisz"
  x = gets.chomp
  puts "napisales: #{x}"
  break if x == 'exit'
}

puts Dir.entries('/') #wypisuje

#File.read('plik')
# FileUtils.cp('skad','dokad')