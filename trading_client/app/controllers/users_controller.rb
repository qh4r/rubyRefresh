class UsersController < ApplicationController

  # JESLI METODA EJST PUSTA TO TAK NARPAWDE NIE EJST WYMAGANE JEJ OBECNOSC W KONTROLERZZE, JESLI ISTNIEJE ODPOWIEDNI WIDOK
  def my_portfolio
    @user_stocks = current_user.stocks
  end

  def self.dupa_test(cos)
    p "\n \n jakis tam tekst sobie o #{cos}"
  end

  #TAKA METOODA JEST WYWOLYWANA PRZY Wczytywaniu tego pliku`
  #dupa_test('haha')

end
