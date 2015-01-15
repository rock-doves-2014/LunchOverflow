class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belong_to :user
  has_many :comments
end
