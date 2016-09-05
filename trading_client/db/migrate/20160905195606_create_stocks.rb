# rails g model Stock ticker:string name:string last_price:decimal
class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :last_price

      t.timestamps null: false
    end
  end
end
