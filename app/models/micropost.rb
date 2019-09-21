class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_attached_file :image, styles: { large: "1600x1600>", medium: "1000x1000>", small: "800x800>" }#, default_url: "https://images.unsplash.com/photo-1505118380757-91f5f5632de0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1781&q=80"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates :user_id, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 5000 }

end
