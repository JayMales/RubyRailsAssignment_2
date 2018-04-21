class AddMyColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :newsId, :int
  end
end
