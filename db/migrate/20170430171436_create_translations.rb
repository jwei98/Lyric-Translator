class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :songID
      t.text :lyric
      t.text :translation

      t.timestamps null: false
    end
  end
end
