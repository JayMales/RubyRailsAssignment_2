class Post < Item

  # Requires a userID to create a post.
  # Can have comments linking from it.
  # Requires text and title. url is optional
  belongs_to :user
  has_many :comments, class_name: 'Comment'
  validates :text, presence: true
  validates :title, presence: true
end
