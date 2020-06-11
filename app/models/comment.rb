class Comment < ApplicationRecord
  validates :user_id, presence: true, allow_nil: false
  validates :post_id, presence: true, allow_nil: false
  validates :content, presence: true, length: { minimum: 10 , maximum: 100}

  def created_date
    return created_at.localtime.strftime '%Y-%m-%d %H:%M:%S'
  end

  def updated_date
    return updated_at.localtime.strftime '%Y-%m-%d %H:%M:%S'
  end
end
