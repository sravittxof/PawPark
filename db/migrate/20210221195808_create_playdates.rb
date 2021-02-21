class CreatePlaydates < ActiveRecord::Migration[6.1]
  def change
    create_table :playdates do |t|

      t.timestamps
    end
  end
end
