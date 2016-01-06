class Topic < ActiveRecord::Base
  belongs_to :user

  validates :author_id, presence: true
  validates :title, presence: true
end
