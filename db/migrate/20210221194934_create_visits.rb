class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.boolean :active_visit
      t.belongs_to :dog, null: false, foreign_key: true
      t.belongs_to :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
