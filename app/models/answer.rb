class Answer < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User'

  validates :topic_id, presence: true
  validates :author_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
end
