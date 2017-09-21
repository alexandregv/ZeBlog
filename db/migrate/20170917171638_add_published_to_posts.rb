class AddPublishedToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :published, :boolean, after: :updated_at, default: false
  end
end
