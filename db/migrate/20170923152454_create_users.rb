class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    
      t.string  :name
      t.string  :password_digest
      t.string  :mail
      t.boolean :confirmed,  default: false
      t.string  :confirmation_token
      t.boolean :has_avatar, default: false
      t.boolean :admin

      t.timestamps
    end
  end
end
