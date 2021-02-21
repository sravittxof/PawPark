class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :size
      t.string :disposition
      t.string :favorite_toy
      t.string :favorite_game
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
