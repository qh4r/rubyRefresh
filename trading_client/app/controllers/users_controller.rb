class UsersController < ApplicationController

  # JESLI METODA EJST PUSTA TO TAK NARPAWDE NIE EJST WYMAGANE JEJ OBECNOSC W KONTROLERZZE, JESLI ISTNIEJE ODPOWIEDNI WIDOK
  def my_portfolio

  end

  #TAKA METOODA JEST WYWOLYWANA PRZY PIERWSZYM UWTWORZENIU KLASY TEGO TYPU - JAK KONSTRUKTOR STATYCZNY
  def self.dupa_test(cos)
    p "\n \n jakis tam tekst sobie o #{cos}"
  end

  #dupa_test('haha')

end
