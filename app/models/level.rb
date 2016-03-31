class Level < ActiveRecord::Base
  belongs_to :creator, class_name: "User"

  has_many :solving_informations, foreign_key: :solved_level_id
  has_many :solvers, through: :solving_informations
end
