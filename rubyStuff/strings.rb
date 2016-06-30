# -*- coding: utf-8 -*-
one, two, three, = ARGV
prompt = '% '
var = 20
test = "jakis tam tekst"
tekst = "jakos tam tekst #{var * 3} ze zmiennymi #{'asdasd'.upcase}"
bool = true
test1 = 'król karol kupił królowej Karolinie '
test2 = "korale koloru koralowego"
testEQ = test1 + test2
puts "hello"
puts 'Rafał'
puts "test 2 + 2 to #{2+2}"
puts "int/int #{131/7}"
puts "float/float #{131.0/7.0}"
puts "float/int #{131.0/7}"
puts "int/float #{131/7.0}"
puts "numerek #{var} i tekst #{test}"
puts tekst
puts "bool #{bool}"
puts testEQ
puts "."*10

formatter = "%{a}, %{b}, %{c}, %{d} - %{e}";
tekst1 = formatter % {a: 'puszki', b: 'konserwy', c: 'muzyka', d: 'bez', e: 'przerwy'}
tekst2 = formatter % {a: 'dziwki', b:'konserwy', c: 'biba', d: 'bez', e: 'przerwy'}
tekst3 = formatter % {a: 'piwo', b: 'woda', c: 'po -', d: ' li', e: 'buda' }
tekst4 = formatter % {a: 'seks', b: 'i', c: 'muzyka', d: ' politechnika', e: '~'}
tekst5 = 'zapychacz';
#musza byc wszystkie klucze

formatter2 = "%{a}\n%{b}\n%{c}\n%{d}\n%{e}\n"
puts formatter2 % {a: tekst1, b: tekst2, c: tekst3, d: tekst4, e: tekst5}

puts '
     block of tekstblock of tekst
block of tekst
block of tekstblock of tekstblock of tekstblock of tekst
block of tekstblock of tekstblock of tekstblock of tekst
block of tekstblock of tekstblock of tekst
'
puts "syf: \f asd\fasd\nasd"

#gets pobiera całą linię
#chomp usuwa \n z linii
#tak naprawde smao gets w tym wypadku wystarczy
puts "first number", prompt
num1 = $stdin.gets.chomp
puts "second number", prompt
num2 = $stdin.gets.chomp
puts "result is: #{num1.to_i(10) + num2.to_i(10)}"

puts "args: #{one}, #{two}, #{three} "