class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :type
      t.string :text
      t.string :title
      t.integer :post_id

      t.timestamps
    end
  end
end
