class Article < ActiveRecord::Base
  # validates :title, :presence => true
  validates :title, presence: true, :length => 5..30
  validates :description, presence: true, length: {minimum: 10}
end