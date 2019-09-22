class Micropost < ApplicationRecord

  if self.imagedb
    before_save { self.content_type = imagedb.content_type }
    before_save { self.filename = sanitize_filename(imagedb.original_filename) }
    before_save { self.imagedb = imagedb.read }
  end
  
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

end
