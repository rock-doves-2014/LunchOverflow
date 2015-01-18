class Comment < ActiveRecord::Base
  validates :content, presence: true
  acts_as_votable
  acts_as_tree order: 'created_at DESC'
  belongs_to :user
  belongs_to :post
end
