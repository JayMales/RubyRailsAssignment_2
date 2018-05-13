class User < ApplicationRecord

  # Makes sure you have have username and password when making a user object
  # This class has two classes linking to it. Posts and comments.
  # I would never store passwords in clear text so I user the bcrypt gem
  # To crypt the password. The tutor said it was the one to use for this.
  has_many :posts, class_name: 'Post'
  has_many :comments, class_name: 'Comment'
  validates_uniqueness_of :username
  validates :username, presence: true
  validates :password, presence: true
  has_secure_password

  def as_json(options = nil)
   super({ only: [:username] }.merge(options || {}))
 end
end
