class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.text :blocks, null: false
      t.text :homes, null: false
      t.text :map
      t.string :level_type, null: false

      t.timestamps null: false
    end
  end
end
