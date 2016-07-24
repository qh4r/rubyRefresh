# eqt = lambda {|a, b| a+ b }
eqt = -> (a ,b) { a + b}

def double_exp(a, b)
  yield(a,b) * 2
end

#block
p double_exp(2, 6) {|a,b| a*b}

#lambda
p double_exp(3, 4, &eqt) # lambde przekazac mozna jako ostatni argument z & zamiast bloku


#zamiast yield bezposredni call na argumencie
def explicit_exp(a, b, &l)
  l.call(a,b)
end

# PARAMETR Z & NIE LICZY SIE JAKO ARGUMENT I MUSI BYC OSTATNI
p explicit_exp(3, 5, &eqt)

p explicit_exp(7, 8) {|a,b| a-b}


def loop_exp(*a, &l)
  # reduce domyslnie przyjmuje 2 argumenty w bloku sume i aktualny
  a.reduce(a.shift, &l)
  #shift pobiera pierwszy element i umozliwia przez to obsluge mnozenia
end

p loop_exp(2, 3, 6, 10, &eqt)

p loop_exp(5, 6, 2, 4, 2) {|a,b| ((a*b)/1.1)}



#BAD PRACTICE -- DO NOT:

#zwykly parametr tez mozliwy choc brzydki
def as_arg_exp(a, b, l)
  l.call(a,b)
end


p as_arg_exp(2, 1, eqt)

# TO NIE ZADZIALA ARGUMENT EQT JEST WYMAGANY
#p asArgEp(6,3) {|a,b| a+b}

#CIEKAWE RZECZY:

# send dziala jak call w js - wywoluje funkcje podana jako 1 argument
p [2,4,2,4].send('reduce',0) {|a,b| a+b} #12
#zamiast stringu mozna podac symbol
p [2,4,2,4].send(:reduce,0) {|a,b| a+b} #12
p 1.send('+',2) #3
p 1.send(:+,2) #3


#INNY SPOSOB NA ZAPIS LAMBDY
# ROWNOWAZNY Z lambda { |a, b| a + b }
short = ->(a, b) { a + b }
puts short.call(2, 3)


