class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :post_type
      t.string :time
      t.string :text
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
