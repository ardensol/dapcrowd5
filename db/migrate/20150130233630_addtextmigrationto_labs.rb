class AddtextmigrationtoLabs < ActiveRecord::Migration
  def up
  	change_column :labs, :about, :text, :limit => nil
  end

  def down
  end
end
