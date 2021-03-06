class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save { self.email = email.downcase, self.chefname = chefname.capitalize }
  validates :chefname, presence: true, length: { minimum: 3, maximum: 40}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105}, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: true
  has_secure_password
end