class Item < ApplicationRecord

  def by
    user.username
  end

  def time
    time = created_at.to_i
  end
end
