class Post < ActiveRecord::Base

  acts_as_votable
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments
end
