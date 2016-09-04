class AddDescriptionColumntToArticles < ActiveRecord::Migration
  def change
    # operacja :tabela, :nazwa, :typ
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
