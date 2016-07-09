#styluje
require 'pp'
#relatywnie od aktualnej sciezki
require_relative 'person'

person = Person.new("Asia", "josziko@gmail.com")

pp person

person.save

