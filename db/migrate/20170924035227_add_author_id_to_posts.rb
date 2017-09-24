class AddAuthorIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author_id, :integer, after: :author
  end
end
