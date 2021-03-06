class Topic < ActiveRecord::Base
  before_create :set_counter
  belongs_to :author, class_name: 'User'
  has_many :answers

  validates :author_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 1200 }

  def creator
    return author.username if author
    'User deleted.'
  end

  private

  def set_counter
    self.counter = 0
  end
end
