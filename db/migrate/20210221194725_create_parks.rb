class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :hours
      t.boolean :open
      t.boolean :small_dog_area
      t.integer :current_visitors

      t.timestamps
    end
  end
end
