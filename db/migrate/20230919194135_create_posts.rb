class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: { to_table: :users }, index: true, foreign_key: "author_id"
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :liked_counter
      t.timestamps
    end
  end
end
