#rails generate migration create_articles

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      #dodane recznie deklaruje kolumne tytul jako string
      # t.TYP :NAZWA
      t.string :title

      #dodalo by timestampy: (created updated)
      # t.timestamps
    end
  end
end

#rake db:migrate

#rake db:rollback