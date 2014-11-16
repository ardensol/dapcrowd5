class ChangetitletonameinPost < ActiveRecord::Migration
  def change
  	add_column :posts, :name, :string
  	remove_column :posts, :title
  end
end
