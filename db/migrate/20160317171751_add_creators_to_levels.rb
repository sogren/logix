class AddCreatorsToLevels < ActiveRecord::Migration
  def change
    change_table :levels do |t|
      t.references :creator
    end
  end
end
