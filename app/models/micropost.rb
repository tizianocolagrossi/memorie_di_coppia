class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_attached_file :image, styles: { large: "1600x1600>", medium: "1000x1000>", small: "800x800>" }# , default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates :user_id, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }

end
