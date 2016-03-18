class SolvingInformation < ActiveRecord::Base
  belongs_to :solver, class_name: "User"
  belongs_to :solved_level, class_name: "Level"
end
