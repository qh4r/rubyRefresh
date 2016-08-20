class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  # validates :title, :presence => true
  validates :title, presence: true, :length => 5..30
  validates :description, presence: true, length: {minimum: 10}
  validates :user_id, presence: true
end