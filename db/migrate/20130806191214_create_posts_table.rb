class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :price
      t.string :email
      t.text :description
      t.integer :category_id
      t.string :access_url
      t.timestamps
    end
  end
end
