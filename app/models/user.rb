class User < ActiveRecord::Base
  email_format = /\b[A-Z0-9._%-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\b/i

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: email_format
  has_secure_password

  has_many :posts
  has_many :comments
end
