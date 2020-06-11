class NewsPost < ApplicationRecord
  validates :author_id, presence: true, allow_nil: false
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }

  def created_date
    return created_at.localtime.strftime '%Y-%m-%d %H:%M:%S'
  end
end
