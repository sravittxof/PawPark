class CreateVisitPlaydates < ActiveRecord::Migration[6.1]
  def change
    create_table :visit_playdates do |t|
      t.belongs_to :visit, null: false, foreign_key: true
      t.belongs_to :playdate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
