# PROC W PRZECIWNOSCI DO METODY MA DOSTEP DO BIEZACEGO KOTNEKSTU

x = 12
l = -> (y) { x * y }
l.call(12) #144
# lambdy i proc maja dostep do zewnetrznego kontekstu, funckje nie
x = 15
l.call(12) #180

class ASD
  def initialize fun
    @fun = fun
  end

  def type
    x = 25
    p x
    @fun.call(12)
  end
end
asd = ASD.new(l)
asd.type
# 25
# 180
x = 1
asd.type
# 25
# 12 # w lambdzie przechowywane jest odniesie do kontekstu w ktorym zostala utworzone i ejst to wiazanie ciagle aktualizowane