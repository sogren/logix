class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :author_id
      t.string :title

      t.timestamps null: false
    end
  end
end
