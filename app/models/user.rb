class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :hisName, presence: true, length: { maximum: 20 }
    validates :herName, presence: true, length: { maximum: 20 }
    validates :anniversary, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
    validates :username, presence: true, length: { maximum: 40 }, uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum: 6 }
end
