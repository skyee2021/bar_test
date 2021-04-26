class CreateFavoriteBars < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_bars do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :bar, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
