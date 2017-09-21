class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
        t.string :name
        t.string :slug
        t.string :author
        t.text :content, limit: 4294967295
        
        t.timestamps
    end
  end
end
