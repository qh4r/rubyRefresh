class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: 3..20
  # w  ruby \A oznacza poczatek a \z koniec linii czyli do co ^ $. ^ $ w ruby oznaczaja poczatek i koniec wielolinijkowo
  EMAIL_REGEX = /\A[\w+\-.]@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: 5..50, format: {with: EMAIL_REGEX }
end