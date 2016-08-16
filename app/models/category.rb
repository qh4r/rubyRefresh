class Category < ActiveRecord::Base
  validates :name, presence: true, length: 5..30, uniqueness: {case_sensitive: false}
end