class Addlabattributes < ActiveRecord::Migration
  def up
  	add_column :campaigns, :lab_id, :integer
  	add_column :labs, :status, :string
  	add_column :labs, :about, :string
  end

  def down
  end
end
