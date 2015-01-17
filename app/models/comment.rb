class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  belongs_to :user
  belongs_to :post
  acts_as_tree order: 'created_at DESC'
end
