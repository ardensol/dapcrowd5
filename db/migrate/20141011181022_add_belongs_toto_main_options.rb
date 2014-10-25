class AddBelongsTotoMainOptions < ActiveRecord::Migration
  def up
  	add_column :mainoptions, :lab_id, :integer
  end

  def down
  end
end
