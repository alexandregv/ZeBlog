class AddPostsCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :posts_count, :integer, after: :slug, default: 0
  end
end
