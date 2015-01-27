class Addheaderimagetolab < ActiveRecord::Migration
  def up
  	add_attachment :labs, :headerimage
  end

  def down
  end
end
