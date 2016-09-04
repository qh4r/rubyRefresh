class User < ActiveRecord::Base
  # dependant: :destroy to kaskada delete na usunieciu
  has_many :articles, dependent: :destroy

  # rownowazne
  # before_save {self.email.downcase!}
  before_save do
    self.email.downcase!
  end

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: 3..20
  # w  ruby \A oznacza poczatek a \z koniec linii czyli do co ^ $. ^ $ w ruby oznaczaja poczatek i koniec wielolinijkowo
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: 5..50, format: {with: EMAIL_REGEX }

  #Czaromagicznie uzywa password_digest w tabeli i atrybutu password na userze do generowania hashy
  has_secure_password

  #call na obiekcie funkcji authenticate(>haslo<) zwraca false lub obiekt usera

end