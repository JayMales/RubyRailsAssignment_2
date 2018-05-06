class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  has_many :comments, class_name: 'Comment'
  validates_uniqueness_of :username
  has_secure_password
end
