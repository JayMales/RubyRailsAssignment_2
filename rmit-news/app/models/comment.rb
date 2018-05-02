class Comment < Item
  belongs_to :user
  belongs_to :post
  validates :post_id, presence: true
end
