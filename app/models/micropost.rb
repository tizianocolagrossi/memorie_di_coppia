class Micropost < ApplicationRecord

  before_save :set_image_data, if: :image_is_here?

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 5000 }

  private
    def sanitize_filename(filename)
      # Get only the filename, not the whole path (for IE)
      # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
      return File.basename(filename)
    end

    def set_image_data
      self.content_type = imagedb.content_type
      self.filename = sanitize_filename(imagedb.original_filename)
      self.imagedb = imagedb.read
    end

    def image_is_here? 
      return imagedb
    end

end
