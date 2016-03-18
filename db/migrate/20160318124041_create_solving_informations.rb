class CreateSolvingInformations < ActiveRecord::Migration
  def change
    create_table :solving_informations do |t|
      t.references :solver, null: false
      t.references :solved_level, null: false
      t.string  :status, default: "unfinished", null: false
      t.integer :solving_time
      t.integer :difficulty
      t.integer :moves
      t.integer :tries, null: false
      t.timestamps null: false
    end
    add_index :solving_informations, :solver_id
    add_index :solving_informations, :solved_level_id
  end
end
