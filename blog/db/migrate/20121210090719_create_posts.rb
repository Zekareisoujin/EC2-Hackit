class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :file_url
      t.string :file_thumbnail
      t.string :description
      t.float :loc_lat
      t.float :loc_long
      t.integer :likes
      t.integer :views
      t.string :title
      t.references :user

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
