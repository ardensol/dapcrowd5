class Post < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.attachment :main_image
      t.string :title
      t.string :sub_title
      t.text :content
      t.integer :user_id
      t.string :slug, :unique => true
      
      t.timestamps
    end
  end
end
