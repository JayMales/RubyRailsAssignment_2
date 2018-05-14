module ItemHelper
  def commentText(count)
    if count == 0
      text = "0 comments"
    else
      text = "#{count} comments"
    end
  end
end
