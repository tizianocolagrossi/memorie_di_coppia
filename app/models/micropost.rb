class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
end
