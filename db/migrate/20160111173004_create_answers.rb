class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text     :content
      t.integer  :author_id
      t.integer  :topic_id

      t.timestamps null: false
    end
    add_index :answers, :topic_id
    add_index :answers, :author_id
  end
end
