class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true, length: 5..30, uniqueness: {case_sensitive: false}
end