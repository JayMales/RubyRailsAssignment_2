class Post < Item

  # Requires a userID to create a post.
  # Can have comments linking from it.
  # Requires text . url is optional
  belongs_to :user
  has_many :comments, class_name: 'Comment'
  # validates :text, presence: true
  validates :title, presence: true

  def as_json(options = nil)
    super(  {methods: [:by, :time], only: [:id, :text,:title, :type, :url]}.merge({}))
  end

end
