class Addvotetriggertolab < ActiveRecord::Migration
  def up
  	add_column :labs, :vote_trigger, :integer
  end

  def down
  end
end
