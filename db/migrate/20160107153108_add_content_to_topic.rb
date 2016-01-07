class AddContentToTopic < ActiveRecord::Migration
  def change
    change_table :topics do |t|
      t.text :content
      t.integer :counter
    end
  end
end
