class Topic < ActiveRecord::Base
  before_create :set_counter
  belongs_to :author, class_name: 'User'

  validates :author_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, length: { maximum: 1200 }

  private

  def set_counter
    self.counter = 0
  end
end
