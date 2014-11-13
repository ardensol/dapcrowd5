class AddSlugtoLab < ActiveRecord::Migration
  def change
  	add_column :labs, :slug, :string, :unique => true
  end

end
