# rails generate scaffold UserStock user_id:integer stock_id:integer

class UserStock < ActiveRecord::Base

  belongs_to :user
  belongs_to :stock

end
