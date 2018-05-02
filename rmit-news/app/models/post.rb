class Post < Item
  belongs_to :user
  has_many :comments, class_name: 'Comment'
  validates :text, presence: true
end
