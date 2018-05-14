class Comment < Item

  # Requires a postid and a userid
  # Also requires text
  belongs_to :user
  belongs_to :post
  validates :post_id, presence: true
  validates :text, presence: true

  def as_json(options = nil)
    super(  {methods: [:by, :time], only: [:id, :text, :type]}.merge({}))
  end

end
