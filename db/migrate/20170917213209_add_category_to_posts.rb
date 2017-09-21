class AddCategoryToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :category, after: :slug, foreign_key: true
  end
end
