class Comment < ActiveRecord::Base
  validates :content, presence: true
  acts_as_votable
  belongs_to :user
  belongs_to :post
end
