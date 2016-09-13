class Testy

  # statyczna zmienna
  @@count = 0

  def initialize
    @id = @@count
    @@count += 1
  end

  # JESLI METODA EJST PUSTA TO TAK NARPAWDE NIE EJST WYMAGANE JEJ OBECNOSC W KONTROLERZZE, JESLI ISTNIEJE ODPOWIEDNI WIDOK
  def my_portfolio
    p "test: #{@id}"
  end

  def self.dupa_test(cos)
    p "\n \n jakis tam tekst sobie o #{cos}"
  end

  #TAKA METOODA JEST WYWOLYWANA PRZY WCZYTYWANIU PLIKU (I KLASY)
  dupa_test('haha')

end

x = Testy.new
y = Testy.new
z = Testy.new
x.my_portfolio
y.my_portfolio
z.my_portfolio