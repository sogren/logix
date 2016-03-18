class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { maximum: 40 }

  has_many :topics, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :levels, foreign_key: :creator_id

  has_many :solving_informations, foreign_key: :solver_id
  has_many :solved_levels, through: :solving_informations
end
